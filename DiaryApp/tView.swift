import SwiftUI
import Combine

// 데이터 모델
struct dyDiary: Identifiable {
    let id = UUID()
    var date: Date
    var title: String
    var water: Int
}

class DiaryViewModel: ObservableObject {
    // 월이 변경될 때마다 water를 초기화하기 위한 Publisher
    @Published var currentMonth: Int = Calendar.current.component(.month, from: Date())
    
    // 저장된 일기 목록
    @Published var diaries: [dyDiary] = []
    
    init() {
        // 현재 월이 변경될 때마다 water 초기화
        $currentMonth
            .sink { [weak self] month in
                self?.resetWaterIfNeeded(for: month)
            }
            .store(in: &cancellables)
        
        // 일기를 로드하고 저장
        loadDiaries()
    }
    
    // water를 초기화하기 위한 함수
    func resetWaterIfNeeded(for month: Int) {
        // 매달 1일이 되었을 때 water를 초기화
        if Calendar.current.component(.day, from: Date()) == 1 {
            for index in diaries.indices {
                diaries[index].water = 0
            }
        }
    }
    
    // water 증가 함수
    func increaseWater(for date: Date) {
        if let index = diaries.firstIndex(where: { $0.date == date }) {
            diaries[index].water += 1
        }
    }
    
    // 일기 추가 함수
    func addDiary(date: Date, title: String) {
        diaries.append(dyDiary(date: date, title: title, water: 1))
        // 추가된 일기의 water 값을 증가시킴
        increaseWater(for: date)
    }
    
    // 일기 로드
    func loadDiaries() {
        // 여기서는 예제로 고정된 데이터를 사용하겠습니다.
        // 실제로는 데이터베이스나 파일에서 데이터를 로드해야 합니다.
        diaries = [
            dyDiary(date: Date(), title: "첫 번째 일기", water: 0),
            dyDiary(date: Date().addingTimeInterval(86400), title: "두 번째 일기", water: 0)
        ]
    }
    
    private var cancellables = Set<AnyCancellable>()
}


struct tView: View {
    @StateObject var viewModel = DiaryViewModel()
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            // DatePicker
            DatePicker("날짜를 선택하세요", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            // 선택한 날짜에 해당하는 일기 표시
            Text("선택한 날짜의 일기")
                .font(.headline)
                .padding()
            ForEach(viewModel.diaries.filter { Calendar.current.isDate($0.date, inSameDayAs: selectedDate) }) { diary in
                Text("\(diary.title), water: \(diary.water)")
            }
            
            Spacer()
            
            // 일기 추가 버튼
            Button("일기 추가") {
                viewModel.addDiary(date: selectedDate, title: "새로운 일기")
            }
            .padding()
        }
    }
}

struct tView_Previews: PreviewProvider {
    static var previews: some View {
        tView()
    }
}


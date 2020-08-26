class Feedback < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '余裕でわかった' },
    { id: 3, name: '少し考えればわかった' },
    { id: 4, name: '難しかった' },
    { id: 5, name: '全然わからなかった' }
  ]
end

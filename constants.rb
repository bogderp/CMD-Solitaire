module Constants
  RANKS = {
    ACE: ['A', 13],
    TWO: ['2', 12],
    THREE: ['3', 11],
    FOUR: ['4', 10],
    FIVE: ['5', 9],
    SIX: ['6', 8],
    SEVEN: ['7', 7],
    EIGHT: ['8', 6],
    NINE: ['9', 5],
    TEN: ['T', 4],
    JACK: ['J', 3],
    QUEEN: ['Q', 2],
    KING: ['K', 1]
  }

  SUITS = {
    Spade: { symbol: '♠', name: 'Spade', color: 'Black' },
    Club: { symbol: '♣', name: 'Club', color: 'Black' },
    Heart: { symbol: '♥', name: 'Heart', color: 'Red' },
    Diamond: { symbol: '♦', name: 'Diamond', color: 'Red' }
  }
end
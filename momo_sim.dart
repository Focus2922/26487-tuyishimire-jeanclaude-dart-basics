// Student: Tuyishimire Jean Claude
// Reg no: 26487
const String regNo = '26487';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by TJC
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by TJC
String formatRwf(int amount) {
  if (amount == 0) return '0 RWF';
  bool isNegative = amount < 0;
  String digits = amount.abs().toString();
  String result = '';
  int count = 0;
  
  for (int i = digits.length - 1; i >= 0; i--) {
    result = digits[i] + result;
    count++;
    if (count % 3 == 0 && i != 0) {
      result = ',' + result;
    }
  }
  
  if (isNegative) {
    result = '-' + result;
  }
  return '\ RWF';
}

// by TJC
bool isValidPin(String pin) {
  if (pin.length != 5) return false;
  if (pin == '12345') return false;
  
  // Check if all are digits and check if all are the same character
  bool allSame = true;
  char firstChar = pin[0];
  
  for (int i = 0; i < pin.length; i++) {
    String ch = pin[i];
    // Check if character is a digit (0-9)
    if (ch.codeUnitAt(0) < 48 || ch.codeUnitAt(0) > 57) {
      return false;
    }
    if (ch != firstChar) {
      allSame = false;
    }
  }
  
  if (allSame) return false;
  return true;
}

// by TJC
int sendMoney(int balance, int amount) {
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  
  int newBalance = balance - (amount + fee);
  print('Sent \ (fee \). New balance: \');
  return newBalance;
}

// by TJC
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime amount out of range (100 - 50,000)');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  
  int newBalance = balance - amount;
  print('Bought airtime \. New balance: \');
  return newBalance;
}

void main() {
  print('Reg no: \ | D = \ | T = \');

  // 1. Test isValidPin with D = 7 ('48217')
  print('isValidPin(\"12345\"): \'); // expected: false
  print('isValidPin(\"77777\"): \'); // expected: false
  print('isValidPin(\"4821\"): \');   // expected: false (length != 5)
  print('isValidPin(\"48a21\"): \'); // expected: false (non-digit)
  print('isValidPin(\"4821\\"): \'); // expected: true

  // 2. Starting balance: 20000 + T * 500 (T = 87 -> 20000 + 43500 = 63500)
  int balance = 20000 + t * 500;
  print('Starting balance: \');

  // 3. Transactions in order:
  // - send (D + 1) * 3000 three times (D = 7 -> 8 * 3000 = 24000)
  int sendAmount = (d + 1) * 3000;
  print('\n-- Transaction 1 --');
  balance = sendMoney(balance, sendAmount);
  print('\n-- Transaction 2 --');
  balance = sendMoney(balance, sendAmount);
  print('\n-- Transaction 3 --');
  balance = sendMoney(balance, sendAmount);

  // - buy 1,000 airtime
  print('\n-- Transaction 4 --');
  balance = buyAirtime(balance, 1000);

  // - send 0
  print('\n-- Transaction 5 --');
  balance = sendMoney(balance, 0);

  // - send 200000
  print('\n-- Transaction 6 --');
  balance = sendMoney(balance, 200000);

  // 4. Final balance
  print('\nFinal balance: \');

  // 5. At least 5 test calls of your own for formatRwf and isValidPin with expected output in comments
  print('\n-- Additional Test Cases --');
  print('formatRwf(0): \');             // Expected: 0 RWF
  print('formatRwf(1250000): \'); // Expected: 1,250,000 RWF
  print('formatRwf(-5000): \');     // Expected: -5,000 RWF
  print('isValidPin(\"00000\"): \'); // Expected: false (all same digits)
  print('isValidPin(\"90284\"): \'); // Expected: true (valid 5-digit PIN)
}

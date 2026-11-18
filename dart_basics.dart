// Student: Tuyishimire Jean Claude
// Reg no: 26487
const String regNo = '26487';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by TJC
int countVowels(String text) {
  // Converts text to lowercase so we only need to check lowercase vowels
  String lower = text.toLowerCase();
  int count = 0;
  for (int i = 0; i < lower.length; i++) {
    String ch = lower[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
  }
  return count;
}

// by TJC
String initials(String fullName) {
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';
  
  // Split by whitespace to handle extra spaces
  List<String> parts = trimmed.split(RegExp(r'\s+'));
  String result = '';
  for (var part in parts) {
    if (part.isNotEmpty) {
      result += '.';
    }
  }
  return result;
}

// by TJC
void drawTriangle(int height) {
  if (height <= 0) return;
  for (int i = 1; i <= height; i++) {
    // Number of spaces: height - i
    String spaces = ' ' * (height - i);
    // Odd rows use '*', even rows use '#'
    String char = (i % 2 != 0) ? '*' : '#';
    String symbols = char * i;
    print('');
  }
}

// by TJC
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by TJC
String maskPhone(String phone) {
  if (phone.length != 10) return 'INVALID';
  return '*****';
}

void main() {
  print('Reg no: \ | D = \ | T = \');

  // B2 Test
  String myName = 'Tuyishimire Jean Claude';
  print('\ has \ vowels');

  // B3 Test
  print('Initials for \"Tuyishimire Jean Claude\": \');
  print('Initials for \" ana uwase \": \"\\"');
  print('Initials for \"   \": \"\\"');

  // C5 Test
  print('\n-- C5 Triangle (height = D + 3 = \) --');
  drawTriangle(d + 3);
  print('Testing height 0 and -2 (should print nothing):');
  drawTriangle(0);
  drawTriangle(-2);

  // D2 Test
  print('\n-- D2 MoMo Receipt Printer --');
  String phone = '0788123456';
  String masked = maskPhone(phone);
  int totalFees = 0;
  
  int limit = d + 3; // 7 + 3 = 10
  for (int i = 1; i <= limit; i++) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt \ | \ RWF | fee \ RWF | to \');
  }
  print('Total fees: \ RWF');
}

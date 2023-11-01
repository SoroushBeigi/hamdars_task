class PersianNumbers{
    static String convertEnToFa(String input){
    input =  input.replaceAll('0','۰');
    input =  input.replaceAll('1','۱');
    input =  input.replaceAll('2','۲');
    input =  input.replaceAll('3','۳');
    input =  input.replaceAll('4','۴');
    input =  input.replaceAll('5','۵');
    input =  input.replaceAll('6','۶');
    input =  input.replaceAll('7','۷');
    input =  input.replaceAll('8','۸');
    input =  input.replaceAll('9','۹');
    return input;
  }
}
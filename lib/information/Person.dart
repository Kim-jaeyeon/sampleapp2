class Person {
  late String _name;
  late String _nickname;
  late int _age;
  late String _gender;
  late String _adress;

  Person(String name,String nickname, int age, String gender, String adress) {
    this._name = name;
    this._nickname=nickname;
    this._age = age;
    this._gender = gender;
    this._adress = adress;

  }


  getName() {
    return _name;
  }

  getNickname(){
    return _nickname;
  }

  getAge() {
    return _age;
  }

  getGender() {
    return _gender;
  }

  getAdress() {
    return _adress;
  }

  setName(String name) {
    this._name = name;
  }

  setNickname(String nickname){
    this._nickname=nickname;
  }

  setAge(int age) {
    this._age = age;
  }

  setGender(String gender) {
    this._gender = gender;
  }

  setAdress(String adress) {
    this._adress = adress;
  }
}

import 'package:flutterchallenge/note%20keeper/db_helper/repository.dart';
import 'package:flutterchallenge/note%20keeper/models/user_models.dart';

class UserService {
  late Repository _repository;
  UserService() {
    _repository = Repository();
  }
  //save user
  saveUser(UserModel user) async {
    return await _repository.insertData('users', user.userMap());
  }

  // read all user
  readAllUserData() async {
    return await _repository.readData('users');
  }

  // update user
  updateUser(UserModel user) async {
    return await _repository.updateData('users', user.userMap(), user.id);
  }

  // delete user
  deleteUser(userId) async {
    return await _repository.deleteDataById('users', userId);
  }
}

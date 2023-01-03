import 'package:develop_n/services/services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProviderProfilePage extends StatefulWidget {
  ProviderProfilePage({super.key});

  @override
  State<ProviderProfilePage> createState() => _ProviderProfilePageState();
}

class _ProviderProfilePageState extends State<ProviderProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();

  getProfileData() async {
    String uid = await Services.getUserId() ?? '2';
    Map data =
        await Services.postData({'user_id': uid}, 'user_profile_view.php');
    nameController.text = data['name'];
    emailController.text = data['email'];
    phoneController.text = data['mobile'];
    qualificationController.text = data['qualification'];
  }

  updateProfile() async {
    String uid = await Services.getUserId() ?? '2';
   var data=await Services.postData({
      'user_id': uid,
      'name': nameController.text,
      'email': emailController.text,
      'mobile': phoneController.text,
      'qualification': qualificationController.text,
      // 'work_status': workStatusController.text,
    }, 'update_user.php');
    if(data['message']=='updated'){
      Fluttertoast.showToast(msg: 'Updated successfully');
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Your profile',
                  style: TextStyle(
                    color: Color.fromARGB(255, 169, 200, 226),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 60),
                TextFormField(
                  controller: nameController,
                  // initialValue: 'password',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 169, 200, 226),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter name';
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: Text(
                      'name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 169, 200, 226),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter email';
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: Text(
                      'email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
                TextFormField(
                  controller: phoneController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 169, 200, 226),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter phone';
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: Text(
                      'phone',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
                TextFormField(
                  controller: qualificationController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 169, 200, 226),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter qualification';
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: Text(
                      'qualification',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
                // TextFormField(
                //   controller: workStatusController,
                //   style: const TextStyle(
                //     color: Color.fromARGB(255, 169, 200, 226),
                //     fontSize: 30,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'enter work status';
                //     }
                //   },
                //   keyboardType: TextInputType.visiblePassword,
                //   decoration: const InputDecoration(
                //     label: Text(
                //       'work status',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 15,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     border: InputBorder.none,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: updateProfile,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 97, 123, 144),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        child: Text('Update'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

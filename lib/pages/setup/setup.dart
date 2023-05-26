import 'package:flutter/material.dart';
import 'package:shareover/utils/constants.dart';

class SetupWidget extends StatefulWidget {
  const SetupWidget({Key? key}) : super(key: key);

  @override
  State<SetupWidget> createState() => _SetupWidgetState();
}

class _SetupWidgetState extends State<SetupWidget> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController streetController;
  late TextEditingController plzController;
  late TextEditingController cityController;
  bool isChecked = false;
  bool anythingEmpty = true;

  @override
  void initState() {
    super.initState();

    usernameController = TextEditingController();
    passwordController = TextEditingController();
    streetController = TextEditingController();
    plzController = TextEditingController();
    cityController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    streetController.dispose();
    plzController.dispose();
    cityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                    textAlign: TextAlign.end,
                    text: const TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: Constants.textSignInTitle,
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          )),
                    ])),
              )),
          TextFormField(
            keyboardType: TextInputType.name,
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: "Username",
              border: OutlineInputBorder(),
            ),
          ),
          Container(
            height: 5,
          ),
          TextFormField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              )),
          Container(height: 25),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  controller: streetController,
                  decoration: const InputDecoration(
                    labelText: "Street",
                    border: OutlineInputBorder(),
                  )),
              Container(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: plzController,
                      decoration: const InputDecoration(
                        labelText: "City code",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: cityController,
                    decoration: const InputDecoration(
                      labelText: "City",
                      border: OutlineInputBorder(),
                    ),
                  ))
                ],
              ),
            ],
          ),
          Container(height: 15),
          Row(
            children: [
              Checkbox(
                checkColor: Theme.of(context).colorScheme.background,
                fillColor: MaterialStateColor.resolveWith((states) => Colors.purple),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                    checkInputs();
                  });
                },
              ),
              const Text("I'm over 16 years old."),
            ],
          ),
          Container(height: 15),
          TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.background),
                  backgroundColor: isChecked ? MaterialStateProperty.all(Colors.purple) : MaterialStateProperty.all(Theme.of(context).colorScheme.background)),
              onPressed: () {setState(() {
                checkInputs();
                isChecked = !anythingEmpty;
              });}, child: const Text("Submit"))
        ]),
      ),
    );
  }

  void checkInputs() {
    if (streetController.value.text.isNotEmpty &&
        cityController.value.text.isNotEmpty &&
        usernameController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty &&
        plzController.value.text.isNotEmpty) {
        anythingEmpty = false;
    } else {
      anythingEmpty = true;
      isChecked = false;
    }
  }
}

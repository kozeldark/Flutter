### Graduation Project - Re:Mind [Flutter (Application)]
***

* Final Presentation PDF File - [Final Presentation.pdf](https://github.com/dntjr41/Graduation_project/files/8812206/default.pdf)
* ### [Graduation Project Proposal(Youtube) - Re:Mind](https://youtu.be/V59beXzW11Y)
* ### [Graduation Project Implementation(Youtube) - Re:Mind](https://youtu.be/JECVPx8Vpys)
* ### [Graduation Project Final(Youtube) - Re:Mind](https://www.youtube.com/watch?v=KEYO8e3j9Ek)

***
* ### [Graduation Project Faceswap Demo - Re:Mind](https://user-images.githubusercontent.com/67234937/171354185-e338a558-b35a-47f2-a857-1a2178b18097.mp4)

* ### [Graduation Project Faceswap + Wav2Lip Demo - Re:Mind](https://user-images.githubusercontent.com/67234937/171354197-1d87a611-b7cb-4564-b3c8-f05d83a45803.mp4)

***
In order to use Re:Mind's Service, the Flask model must be installed in addition to the Flutter. <br>
Please go to the link and install the Flask Model. <br>
[Re:Mind Flask Model Wiki Page](https://github.com/dntjr41/Graduation_project/wiki)

# Re:Mind [Application] Setting

## Setting Computer

### Require Android Studio & Flutter Plugins

Install Android Studio - 
[https://developer.android.com/studio](https://developer.android.com/studio)

Install Flutter - 
[https://blog.yena.io/studynote/2020/02/04/Android-Flutter-Install.html](https://blog.yena.io/studynote/2020/02/04/Android-Flutter-Install.html)

### Setting Android Studio's Android Device

Install Android Virtual Device - Android 11.0 / API 30 <br>
[https://developer.android.com/studio/run/managing-avds?hl=ko](https://developer.android.com/studio/run/managing-avds?hl=ko)
<br>

### Download the Flutter File or Connect it to the Github repository
Download Flutter File - [Google Drive](https://drive.google.com/file/d/1Dj7MCE-Nvn-5uekgMbEt7PTasAuiyvjv/view?usp=sharing)

Github Repository - [https://github.com/kozeldark/Flutter](https://github.com/kozeldark/Flutter)


**Re:Mind Flutter Package Preparation**
```
flutter pub upgrade
```

Check pubspec.ymal!
```
environment:
  sdk: ">=2.7.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  dio: ^4.0.0
  file_picker: ^4.4.0
  firebase_auth: ^3.0.1
  firebase_core: ^1.12.0
  google_sign_in: ^5.0.7
  flutterfire_ui: ^0.1.0-dev.1
  fluttertoast: ^8.0.5
  image_picker: ^0.8.3+1
  flutter_image_compress: ^0.6.5+1
  firebase_storage: ^8.1.1
  cloud_firestore: ^3.1.10
  flutter_signin_button: ^2.0.0
  firebase_auth_web: ^3.1.3
  audioplayers: ^0.20.1

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.3
  flutter_svg: ^0.22.0-nullsafety.3 # it help us to use SVG in our app
  firebase_messaging: ^11.2.8
  video_player: 2.1.15

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  assets:
    - assets/images/
    - assets/icons/
    - assets/demo.mp4
```

***
> Table Of Contents <br>
> [1. Login & Profile Management](#1-login) <br>
> [2. GIF (Without Audio)](#2-gif) <br>
> [3. MP4 (With Audio)](#3-mp4) <br>
> [4. Assets Management](#4-assets) <br>
> [5. Demo Video](#5-demo) <br>
> [6. Role](#5-role) <br>

***
# 1. Login & Profile Management
| First Page | Loading Page | Profile Button | Profile Management |
| ---------- | ------------ | -------------- | ------------------ |
| ![image](https://user-images.githubusercontent.com/67234937/171089359-811f9891-7de9-487a-b48f-0541e759633b.png) | ![image](https://user-images.githubusercontent.com/67234937/171089374-8ba583f9-4fb0-4e9b-9c54-ee375567da90.png) | ![image](https://user-images.githubusercontent.com/67234937/171089573-6adf32b1-78ba-4209-b38c-5b4e07bb1239.png) | ![image](https://user-images.githubusercontent.com/67234937/171089588-4531a4ef-24ba-4ff9-bec6-2696129117c6.png) |

* The administrator of user account must register SHA-256 with Firebase - [Register SHA-256](https://geojun.tistory.com/61)

* If you want to change the UI related to login, please modify the dart file in the login folder - [Login Folder](https://github.com/kozeldark/Flutter/tree/main/lib/screens/login) <br> ![login](https://user-images.githubusercontent.com/67234937/171090333-0da723f8-bef5-45da-bf37-ff99bd058361.png)

***
# 2. GIF (Without Audio)
| Main Page | Choose Template | Input Image & Show Result | My Files | Result Page |
| --------- | --------------- | ------------------------- | -------- | ----------- |
| ![image](https://user-images.githubusercontent.com/67234937/171090793-9c5c750a-add7-4694-865a-4fa6f4c00cd8.png) | ![image](https://user-images.githubusercontent.com/67234937/171090783-5169eb6c-89e1-4e76-b4f8-d966bd9f9ca7.png) | ![image](https://user-images.githubusercontent.com/67234937/171090805-3ff6e299-15c4-41a2-a28d-926b475a4d6c.png) | ![image](https://user-images.githubusercontent.com/67234937/171090813-c76919d8-f4a0-4964-8533-5be67e2a2a87.png) | ![image](https://user-images.githubusercontent.com/67234937/171090826-3a12e5a8-76bd-403a-9b2b-1f98325b939f.png) |

* If you want to change UI related to GIF & MP4, please modify the dart file in the details & home folder - [Details & Home Folder](https://github.com/kozeldark/Flutter/tree/main/lib/screens) <br> ![gif](https://user-images.githubusercontent.com/67234937/171091407-a228222e-ee16-4cd4-a72c-7050c4cb6ace.png)

### Cautions!!
* In the case of GIF, if you do not insert your image file, you will not go to the result screen.

***
# 3. MP4 (With Audio)
| Main Page | Choose Template | Input Image & Show Result | My Files(Image) | My Files(Audio) |
| --------- | --------------- | ------------------------- | --------------- | --------------- |
| ![image](https://user-images.githubusercontent.com/67234937/171090975-74b8724f-597c-448c-9501-8313b35895c5.png) | ![image](https://user-images.githubusercontent.com/67234937/171093200-6b912b9f-151d-4d38-8f54-63946742b613.png) | ![image](https://user-images.githubusercontent.com/67234937/171091020-3015e4d6-0570-463f-8cc9-270234ed470d.png) | ![image](https://user-images.githubusercontent.com/67234937/171091033-cfbfd737-be48-4746-acf7-cf589a122db3.png) | ![image](https://user-images.githubusercontent.com/67234937/171091052-b6500513-5189-46c0-b70f-8f54f8752d93.png) | 

### Cautions!!
* In the case of MP4, if you do not insert your image & Audio file, you will not go to the result screen.

***
# 4. Assets Management
| GIF Templates | MP4 Templates | Icon Templates |
| ------------- | ------------- | -------------- |
| ![gif_template](https://user-images.githubusercontent.com/67234937/171092085-5db6c1ff-74d8-4775-901c-609dcdf8488f.png) | ![mp4_template](https://user-images.githubusercontent.com/67234937/171092094-bcb38839-e21f-4b54-ad67-cc40bd37bf04.png) | ![icon](https://user-images.githubusercontent.com/67234937/171092406-bd6760ca-457d-4b6d-8111-f761ee143e92.png) |

* The default templates are GIF - 33 / MP4 - 9.

* If you want to add or modify templates, see Assets Folder - [Assets Folder (https://github.com/kozeldark/Flutter/tree/main/assets) <br> ![assets](https://user-images.githubusercontent.com/67234937/171092653-f0394bb9-81a6-4b4b-8fa0-3a7ac8f662a7.png)

* If you want to change Template & UI related to Assets, please modify the dart file in the home folder - [Home Folder](https://github.com/kozeldark/Flutter/tree/main/lib/screens/home/components) <br> ![home](https://user-images.githubusercontent.com/67234937/171093911-ac6c4062-c219-4c14-bce1-773f98d93a23.png)

***
# 5. Demo Video
| GIF(Without Audio) | MP4(With Audio) |
| ------------------ | --------------- |
| https://user-images.githubusercontent.com/67234937/171351265-2f013a6e-5ee5-4cb3-ab93-6040c5d273dd.mp4 | https://user-images.githubusercontent.com/67234937/171351294-b8326a2a-9cfa-44c6-96f9-e11db400b593.mp4 |

***
# 6. Role

<table>
<tr> <td>심우석(201636417)</td> <td>qkqh8639@gmail.com</td> <td>Lightweight, Flutter, Documentation</td> </tr>
<tr> <td>오찬희(201735855)</td> <td>fasvvc@gmail.com</td> <td>Modeling, Lightweight, Flutter, Documentation</td> </tr>
<tr> <td>김다혜(201835414)</td> <td>ekgp3987@naver.com</td> <td>Modeling, Flutter, Documentation</td> </tr>
<tr> <td>선다혜(201835466)</td> <td>adad05011@gachon.ac.kr</td> <td>Modeling, LightWeight, Documentation</td> </tr>
</table>

***
### Copyright
The file above is open source. Please contact us by [email](qkqh8639@gmail.com) <br>
if you would like commercial use, except for non-commercial use.

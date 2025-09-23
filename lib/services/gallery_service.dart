import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class GalleryService {
  
  final ImagePicker _picker = ImagePicker(); //UNDERLINE é SOMENTE DENTRO DA CLASSE

  //CHECAR PERMISSOES DE ACESSO DA CAMERA
  Future _checkCameraPermission() async{
    final status = await Permission.camera.request(); 
    return status == PermissionStatus.granted;
  }

  //CHECAR PERMISSOES DE ACESSO DA GALERIA
  Future<bool> _checkGalleryPermission() async{
    final status = Permission.photos.request();
    return status == PermissionStatus.granted;
  }

  //METODO DE SELECIONAR A IMAGEM NA GALERIA
  Future selectImageFromGallery() async{
    bool permission = await _checkCameraPermission();
    if(!permission){
      throw Exception('Permissão não concedida para acessar a galeria');
    }

    //SELECIONAR A IMAGEM DA GALERIA
    XFile? image = await _picker.pickImage(source: ImageSource.gallery); //? PODE SER NULO

    if(image != null){
      return File(image.path); //PATH CAMINHO DO ARQUIVO
    }

    return null;
  }

  //METODO CAPTURAR IMAGEM DA CAMERA
  Future captureImageFromCamera() async{
    final permission = await _checkCameraPermission();
    if(!permission){
            throw Exception('Permissão negada para acessar a câmera');
    }

    XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if(image != null){
      return File(image.path);
    }
    return null;
  }

  //SELECIONA MULTIPLAS IMAGENS
  Future<List<File>> selectMultipleImages() async{
    final permission = await _checkCameraPermission();

    if (!permission) {
      throw Exception('Não foi possivel acessar a galeria de imagens');
    }

    List<XFile> images = await _picker.pickMultiImage(limit: 5); //O MAP PEGA O ARRAY E CONVERTE PARA UM NOVO ARRAY

     return images.map((xfile) => File(xfile.path)).toList();
    
  }
}
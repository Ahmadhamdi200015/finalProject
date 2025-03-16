
import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class ArchiveData {
  final Crud crud;

  ArchiveData(this.crud);

  Future<dynamic> getArchive(String userid) async {
    var response = await crud.dataPost(AppLink.archiveOrder,{
      "id":userid.toString()
    });
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }

}
import 'package:tech_store/features/productslist/data/models/price_count_model.dart';

class CountsModel{
  List<PriceCountModel> counts;
  CountsModel({required this.counts});
 factory CountsModel.fromJson(Map<String,dynamic>json){
   return(CountsModel(counts: List<PriceCountModel>.from(json['counts'].map((x)=>PriceCountModel.fromJson(x)))));
 }


}
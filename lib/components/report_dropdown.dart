import 'package:amber_erp/Pages/lpo_pending.dart';
import 'package:amber_erp/Pages/pos_reconcilation.dart';
import 'package:amber_erp/Pages/summary_report.dart';
import 'package:amber_erp/Pages/vouchers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
class ReportDropdown extends StatefulWidget {
  final String text;
  const ReportDropdown({Key? key,required this.text}) : super(key: key);

  @override
  _ReportDropdownState createState() => _ReportDropdownState();
}

class _ReportDropdownState extends State<ReportDropdown> {

  late GlobalKey actionKey;
  late double height,width,xPosition,yPosition;
  bool isDropdownOpen = false;
  late OverlayEntry floatingDropdown;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData(){
    RenderBox renderBox = actionKey.currentContext!.findRenderObject() as RenderBox;
    height=renderBox.size.height;
    width=renderBox.size.width+20;
   Offset offset =  renderBox.localToGlobal(Offset.zero);
   xPosition = offset.dx;
   yPosition = offset.dy;
  }

  OverlayEntry _createFlotingDropdown(){
    return OverlayEntry(builder: (context){
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition + height,
        height: 4 * height + 40,
        child: DropDown(
          itemHeight:height,
          change: close,
        ),
      );
    });
  }


  toggle(){
    setState(() {
      if(isDropdownOpen){
        floatingDropdown.remove();
      }else{
        findDropdownData();
        floatingDropdown = _createFlotingDropdown();
        Overlay.of(context)!.insert(floatingDropdown);
      }


      isDropdownOpen =!isDropdownOpen;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: toggle,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue.shade600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Row(
          children: [
            Text(widget.text.toUpperCase(),
              style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            const Icon(Icons.arrow_drop_down,color: Colors.white,)
          ],
        ),
      ),
    );
  }
  close(){
    setState(() {
      if(isDropdownOpen){
        floatingDropdown.remove();

        isDropdownOpen =!isDropdownOpen;
      }
    });
  }
  @override
  void dispose() {
   close();
    super.dispose();
  }
}
class DropDown extends StatelessWidget {
  final double itemHeight;
   DropDown({Key? key,required this.itemHeight,required this.change}) : super(key: key);
  Function()? change;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5,),
        Align(
          alignment: const Alignment(-0.85,0),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              height: 20,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.blue.shade600
              ),
            ),
          ),
        ),
        Material(
          elevation: 20,
          shape: ArrowShape(),
          child: Container(
            height: 4 * itemHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [
                InkWell(onTap: (){
                  change!();
                  Get.to(()=>const SummaryReport());
                },
                  child: DropDownItem.first(
                    text: 'SummaryReport',
                    iconData: Icons.add_circle_outline,
                    isSelected: false,
                  ),
                ),
                InkWell(onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>SupportPage()));
                  change!();
                  Get.to(()=>const PosReconcilation());
                },
                  child: const DropDownItem(
                    text: 'Pos reconcilation',
                    iconData: Icons.add_circle_outline,
                    isSelected: false,
                  ),
                ),
                InkWell(onTap: (){
                  change!();
                  Get.to(()=>const Vouchers());
                },
                  child: const DropDownItem(
                    text: 'Accounts Vocher',
                    iconData: Icons.add_circle_outline,
                    isSelected: false,
                  ),
                ),
                InkWell(onTap: (){
                  change!();
                  Get.to(()=>const LpoPendingReport());
                },
                  child: DropDownItem.last(
                    text: 'LPO Pending Report',
                    iconData: Icons.add_circle_outline,
                    isSelected: true,
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }
}

class DropDownItem extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;
  const DropDownItem({Key? key,required this.text,required this.iconData, this.isSelected=false, this.isFirstItem=false,this.isLastItem=false}) : super(key: key);

  factory DropDownItem.first({required String text,required IconData iconData,required bool isSelected}){
    return DropDownItem(text: text, iconData: iconData, isSelected: isSelected,isFirstItem: true,);
  }
  factory DropDownItem.last({required String text,required IconData iconData,required bool isSelected}){
    return DropDownItem(text: text, iconData: iconData, isSelected: isSelected,isLastItem: true,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: isFirstItem ? const Radius.circular(8):Radius.zero,bottom: isLastItem ? const Radius.circular(8):Radius.zero),
        color: isSelected ? Colors.blue.shade800 : Colors.blue.shade600,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Row(
        children: [
          Text(text.toUpperCase(),
            style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Icon(iconData,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}


class ArrowClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   Path path = Path();

   path.moveTo(0, size.height);
   path.lineTo(size.width/2, 0);
   path.lineTo(size.width, size.height);

   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper)=> true;


  
}

class ArrowShape extends ShapeBorder{
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getOuterPath
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width/2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

}



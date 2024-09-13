import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import '../utils/global_variable.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {

  final pdf = pw.Document();

  Future<void> generateAndSavePdf() async {
    final netImage = await networkImage('https://static.vecteezy.com/system/resources/previews/010/482/794/non_2x/kitchen-chef-logo-design-template-vector.jpg');

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Padding(
                      padding: pw.EdgeInsets.all(15),
                      child: pw.Column(
                        children: [
                          pw.Row(
                            children: [
                              pw.Container(
                                child: pw.Image(netImage, height: 150),
                              ),
                              pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text("Company Name",
                                    style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  pw.Text("Jewel",
                                    style: pw.TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text("Bill To:",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.Text("Customer Name: ${Globals.name}",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Row(
                                children: [
                                  pw.Text('Address: ${Globals.address}',
                                    style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  pw.SizedBox(width: 150),
                                  pw.Text('Total Due',
                                    style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              pw.SizedBox(height: 5),
                              pw.Row(
                                children: [
                                  pw.Text('Phone: ${Globals.phone}',
                                    style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  pw.SizedBox(width: 150),
                                  pw.Text("₹${Globals.totalPrice}",
                                    style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          pw.SizedBox(height: 20),
                          pw.Container(
                            height: 50,
                            width: 500,
                            child: pw.Padding(
                              padding: pw.EdgeInsets.all(8.0),
                              child: pw.Row(
                                children: [
                                  pw.Expanded(
                                      flex:10,
                                      child: pw.Container(
                                          alignment:pw.Alignment.center,
                                          child:pw.Text("ITEM", style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)))),
                                  pw.Expanded(
                                      flex:3,
                                      child: pw.Container(child: pw.Text("QTY", style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)))),
                                  pw.Expanded(
                                      flex:4,
                                      child: pw.Container(child: pw.Text("PRICE", style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)))),
                                  pw.Expanded(
                                      flex:4,
                                      child: pw.Container(child: pw.Text("SUBTOTAL", style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)))),
                                ],
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.all(8.0),
                            child: pw.Column(
                              children: Globals.cartItem.map((e) {
                                return pw.Column(
                                  children: [
                                    pw.Padding(
                                      padding: pw.EdgeInsets.all(8.0),
                                      child: pw.Row(
                                        children: [
                                          pw.Expanded(
                                              flex:10,
                                              child: pw.Container(
                                                  alignment:pw.Alignment.topLeft,
                                                  child: pw.Text(e['name'], style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)))),
                                          pw.Expanded(
                                              flex:3,
                                              child: pw.Container(child: pw.Text('${e['quantity']}', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)))),
                                          pw.Expanded(
                                              flex:4,
                                              child: pw.Container(child: pw.Text(
                                                  "Rs. ${e['price']}", style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)))),
                                          pw.Expanded(
                                              flex:3,
                                              child: pw.Container(child: pw.Text(" ${e['quantity'] * e['price']}", style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)))),
                                        ],
                                      ),
                                    ),
                                    pw.Divider(thickness: 2),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(right: 30),
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.end,
                              children: [
                                pw.Text('TOTAL:Rs. ${Globals.totalPrice}',
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text("Contact",
                                style: pw.TextStyle(
                                  fontWeight:pw.FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              pw.SizedBox(height: 15),
                              pw.Text('Phone: ${Globals.phone}',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text('Email: ${Globals.email}',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              pw.SizedBox(height: 40),
                              pw.Text("Thank You For Your Purchase!",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
      },
    ));

   // Save the PDF
    Directory? folder=await getDownloadsDirectory();
    File pdfFile = File("${folder!.path}/resume.pdf");
    await pdfFile.writeAsBytes(await pdf.save());

    // Print/Save PDF
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf_outlined, size: 30),
            onPressed: () async {
              await generateAndSavePdf();
              },
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Image.network('https://static.vecteezy.com/system/resources/previews/010/482/794/non_2x/kitchen-chef-logo-design-template-vector.jpg', height: 100, width: 100),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Company Name",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text("Jewel",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bill To:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Customer Name: ${Globals.name}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Address: ${Globals.address}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 150),
                            Text('Total Due',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Phone: ${Globals.phone}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 150),
                            Text("₹${Globals.totalPrice}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: 500,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex:10,
                                child: Container(
                                    alignment:Alignment.center,
                                    child: Text("ITEM", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
                            Expanded(
                                flex:3,
                                child: Container(child: Text("QTY", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
                            Expanded(
                                flex:4,
                                child: Container(child: Text("PRICE", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
                            Expanded(
                                flex:4,
                                child: Container(child: Text("SUBTOTAL", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: Globals.cartItem.map((e) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex:10,
                                        child: Container(
                                          alignment:Alignment.topLeft,
                                            child: Text(e['name'], style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)))),
                                    Expanded(
                                        flex:3,
                                        child: Container(child: Text('${e['quantity']}', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)))),
                                    Expanded(
                                        flex:4,
                                        child: Container(child: Text("₹ ${e['price']}", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)))),
                                    Expanded(
                                        flex:3,
                                        child: Container(child: Text(" ${e['quantity'] * e['price']}", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)))),
                                  ],
                                ),
                              ),
                              Divider(thickness: 2),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('TOTAL: ${Globals.totalPrice}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Contact",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text('Phone: ${Globals.phone}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Email: ${Globals.email}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 40),
                        Text("Thank You For Your Purchase!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

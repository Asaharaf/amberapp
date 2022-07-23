class Branch {
  String? branchId;
  String? branchName;
  String? clientId;
  String? rowId;

  Branch({this.branchId, this.branchName, this.clientId, this.rowId});

  Branch.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    clientId = json['client_id'];
    rowId = json['row_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['branch_id'] = this.branchId;
    data['branch_name'] = this.branchName;
    data['client_id'] = this.clientId;
    data['row_id'] = this.rowId;
    return data;
  }
}

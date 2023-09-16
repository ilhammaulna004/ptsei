<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Job Order</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">

        {{-- <form method="post" action="{{$action}}" id="scaffold" pjax-container> --}}
        <form method="post" action="{{$action}}" id="scaffold" pjax-container>
            <div class="box-body">
                <div class="form-horizontal">
                    {{-- <div class="form-group">
                        <label for="inputNomorJobOrder" class="col-sm-1 control-label">No. Job Order</label>    
                        <div class="col-sm-4">
                            <input type="text" name="nomor_job_order" class="form-control" id="inputNomorJobOrder" placeholder="Nomor Job Order" value="{{ old('nomor_job_order') }}">
                        </div>    
                    </div> --}}
                    <div class="form-group">
                        <label for="inputCustomerId" class="col-sm-1 control-label">Customer</label>    
                        <div class="col-sm-4">
                            <select style="" name="customer_id">
                                @foreach ($data_customer as $customer)
                                <option value="{{$customer->id}}">{{$customer->fullname}} - {{$customer->address}}</option>
                                @endforeach
                            </select>
                        </div>    
                        <span class="help-block hide" id="table-name-help">
                            <i class="fa fa-info"></i>&nbsp; Customer Tidak Boleh Kosong!
                        </span>    
                    </div>
                    <div class="form-group">
                        <label for="inputPrice" class="col-sm-1 control-label">Price</label>
                        <div class="col-sm-4">
                            <input type="text" name="price" class="form-control price_jo" id="inputPrice" placeholder="Price" value="{{ old('price') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputmulai_date_riksa" class="col-sm-1 control-label"> Mulai Date Riksa </label>
                        <div class="col-sm-4">
                            <input type="text" name="mulai_date_riksa" class="form-control date_riksa_start_jo" id="inputmulai_date_riksa" placeholder="Mulai Date Riksa" value="{{ old('mulai_date_riksa') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputselesai_date_riksa" class="col-sm-1 control-label"> Selesai Date Riksa </label>
                        <div class="col-sm-4">
                            <input type="text" name="selesai_date_riksa" class="form-control date_riksa_end_jo" id="inputselesai_date_riksa" placeholder="Selesai Date Riksa" value="{{ old('selesai_date_riksa') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputnomor_po" class="col-sm-1 control-label"> Nomor PO </label>
                        <div class="col-sm-4">
                            <input type="text" name="nomor_po" class="form-control" id="inputnomor_po" placeholder="Nomor PO" value="{{ old('nomor_po') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputdate_pembayaran" class="col-sm-1 control-label"> TGL. Pembayaran </label>
                        <div class="col-sm-4">
                            <input type="text" name="date_pembayaran" class="form-control" id="inputdate_pembayaran" placeholder="TGL. Pembayaran" value="{{ old('date_pembayaran') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputstatus_pembayaran" class="col-sm-1 control-label"> Status Pembayaran </label>
                        <div class="col-sm-4">
                            <input type="radio" name="status_pembayaran" id="" class="inputstatus_pembayaran" value="2">Sudah Lunas
                            <input type="radio" name="status_pembayaran" id="" class="inputstatus_pembayaran" value="1">Setengah Pembayaran
                            <input type="radio" name="status_pembayaran" id="" class="inputstatus_pembayaran" checked value="0">Belum Ada Pembayaran
                        </div>                
                    </div>
                    <div class="form-group">
                        <label for="inputnama_pengawas" class="col-sm-1 control-label"> Nama Pengawas </label>
                        <div class="col-sm-4">
                            <input type="text" name="nama_pengawas" class="form-control" id="inputnama_pengawas" placeholder="Project By" value="{{ old('nama_pengawas') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputnohp_pengawas" class="col-sm-1 control-label"> NO. HP. Pengawas </label>
                        <div class="col-sm-4">
                            <input type="text" name="nohp_pengawas" class="form-control" id="inputnohp_pengawas" placeholder="Project By" value="{{ old('nohp_pengawas') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputproject_by" class="col-sm-1 control-label"> Project By </label>
                        <div class="col-sm-4">
                            <input type="text" name="project_by" class="form-control" id="inputproject_by" placeholder="Project By" value="{{ old('project_by') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputdescription" class="col-sm-1 control-label"> Description </label>
                        <div class="col-sm-4">
                            <input type="text" name="description" class="form-control" id="inputdescription" placeholder="Description" value="{{ old('description') }}">
                        </div>
                    </div>
                </div>
                <hr />
                <h4>Jasa</h4>
                <table class="table table-hover" id="table-fields">
                    <tbody>
                    <tr>
                        <th style="width: 200px">Nama Jasa</th>
                        <th>qty</th>
                        <th>Harga Per Unit</th>
                        <th>Mulai Date Riksa</th>
                        <th>Selesai Date Riksa</th>
                        <th>Mulai Pengecekan</th>
                        <th>Selesai Pengecekan</th>
                        <th>Notes</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <td>
                            <select style="width: 150px" name="fields[0][jasa_id]">
                                @foreach ($data_jasa as $jasa)
                                <option value="{{$jasa->id}}">{{$jasa->nama}} - {{$jasa->harga}}</option>
                                @endforeach
                            </select>
                        </td>
                        <td><input type="number" class="form-control" name="fields[0][qty]" placeholder="Qty"></td>
                        <td><input type="text" class="price_per_unit form-control" name="fields[0][price_per_unit]"></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-calendar fa-fw"></i>
                                </span>
                                <input type="text" class="form-control" id="mulai_date_riksa" placeholder="" name="fields[0][mulai_date_riksa]">
                            </div>
                        </td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-calendar fa-fw"></i>
                                </span>
                                <input type="text" class="form-control selesai_date_riksa" id="selesai_date_riksa" placeholder="" name="fields[0][selesai_date_riksa]">
                            </div>
                        </td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-calendar fa-fw"></i>
                                </span>
                                <input type="text" class="form-control mulai_pengecekan" id="mulai_pengecekan" placeholder="" name="fields[0][mulai_pengecekan]">
                            </div>
                        </td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-calendar fa-fw"></i>
                                </span>
                                <input type="text" class="form-control selesai_pengecekan" id="selesai_pengecekan" placeholder="" name="fields[0][selesai_pengecekan]">
                            </div>
                        </td>
                        <td><input type="text" class="form-control" placeholder="" name="fields[0][description]"></td>
                        <td><a class="btn btn-sm btn-danger table-field-remove"><i class="fa fa-trash"></i> remove</a></td>
                    </tr>
                    </tbody>
                </table>
                <hr style="margin-top: 0;"/>
                <div class='form-inline margin' style="width: 100%">
                    <div class='form-group'>
                        <button type="button" class="btn btn-sm btn-success" id="add-table-field"><i class="fa fa-plus"></i>&nbsp;&nbsp;Add field</button>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <button type="submit" class="btn btn-info pull-right">submit</button>
            </div>
            {{ csrf_field() }}

            <!-- /.box-footer -->
        </form>

    </div>

</div>

<template id="table-field-tpl">
    <tr>
        <td>
            <select style="width: 150px" name="fields[__index__][jasa_id]">
                @foreach ($data_jasa as $jasa)
                <option value="{{$jasa->id}}">{{$jasa->nama}} - {{$jasa->harga}}</option>
                @endforeach
            </select>
        </td>
        <td><input type="number" class="form-control" name="fields[__index__][qty]" placeholder="Qty"></td>
        <td><input type="text" class="price_per_unit_p form-control" name="fields[__index__][price_per_unit]"></td>
        <td>
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-calendar fa-fw"></i>
                </span>
                <input type="text" class="form-control mulai_date_riksa_p" placeholder="" name="fields[__index__][mulai_date_riksa]">
            </div>
        </td>
        <td>
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-calendar fa-fw"></i>
                </span>
                <input type="text" class="form-control selesai_date_riksa_p" placeholder="" name="fields[__index__][selesai_date_riksa]">
            </div>
        </td>
        <td>
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-calendar fa-fw"></i>
                </span>
                <input type="text" class="form-control mulai_pengecekan_p" placeholder="" name="fields[__index__][mulai_pengecekan]">
            </div>
        </td>
        <td>
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-calendar fa-fw"></i>
                </span>
                <input type="text" class="form-control selesai_pengecekan_p" placeholder="" name="fields[__index__][selesai_pengecekan]">
            </div>
        </td>
        <td><input type="text" class="form-control" placeholder="" name="fields[__index__][description]"></td>
        <td><a class="btn btn-sm btn-danger table-field-remove"><i class="fa fa-trash"></i> remove</a></td>
    </tr>
</template>

<template id="model-relation-tpl">
    <tr>
        <td><input type="text" class="form-control" placeholder="relation name" value=""></td>
        <td>
            <select style="width: 150px">
                <option value="HasOne" selected>HasOne</option>
                <option value="BelongsTo">BelongsTo</option>
                <option value="HasMany">HasMany</option>
                <option value="BelongsToMany">BelongsToMany</option>
            </select>
        </td>
        <td><input type="text" class="form-control" placeholder="related model"></td>
        <td><input type="text" class="form-control" placeholder="default value"></td>
        <td><input type="text" class="form-control" placeholder="default value"></td>
        <td><input type="checkbox" /></td>
        <td><a class="btn btn-sm btn-danger model-relation-remove"><i class="fa fa-trash"></i> remove</a></td>
    </tr>
</template>

<script>

$( document ).ready(function() {

    $('.date_riksa_end_jo').datetimepicker({"format":"YYYY-MM-DD HH:mm:ss","locale":"en","allowInputToggle":true});
    $('.date_riksa_start_jo').datetimepicker({"format":"YYYY-MM-DD HH:mm:ss","locale":"en","allowInputToggle":true});
    $('#inputdate_pembayaran').datetimepicker({"format":"YYYY-MM-DD HH:mm:ss","locale":"en","allowInputToggle":true});
    $('.price_jo').inputmask({"alias":"currency","radixPoint":".","prefix":"","removeMaskOnSubmit":true});
    $('.inputstatus_pembayaran').iCheck({radioClass:'iradio_minimal-blue'});   

    $('#mulai_date_riksa').parent().datetimepicker({"format":"YYYY-MM-DD HH:mm:ss","locale":"en","allowInputToggle":true});
    $('#selesai_date_riksa').parent().datetimepicker({"format":"YYYY-MM-DD HH:mm:ss","locale":"en","allowInputToggle":true});
    $('#mulai_pengecekan').parent().datetimepicker({"format":"YYYY-MM-DD HH:mm:ss","locale":"en","allowInputToggle":true});
    $('#selesai_pengecekan').parent().datetimepicker({"format":"YYYY-MM-DD HH:mm:ss","locale":"en","allowInputToggle":true});
    $('.price_per_unit').inputmask({"alias":"currency","radixPoint":".","prefix":"","removeMaskOnSubmit":true});
    
    

    $('input[type=checkbox]').iCheck({checkboxClass:'icheckbox_minimal-blue'});
    $('select').select2();

    $('#add-table-field').click(function (event) {
        $('#table-fields tbody').append($('#table-field-tpl').html().replace(/__index__/g, $('#table-fields tr').length - 1));
        $('select').select2();
        $('input[type=checkbox]').iCheck({checkboxClass:'icheckbox_minimal-blue'});

        $('.mulai_date_riksa_p').parent().datetimepicker({"format":"YYYY-MM-DD HH:mm:ss","locale":"en","allowInputToggle":true});
        $('.selesai_date_riksa_p').parent().datetimepicker({"format":"YYYY-MM-DD HH:mm:ss","locale":"en","allowInputToggle":true});
        $('.mulai_pengecekan_p').parent().datetimepicker({"format":"YYYY-MM-DD HH:mm:ss","locale":"en","allowInputToggle":true});
        $('.selesai_pengecekan_p').parent().datetimepicker({"format":"YYYY-MM-DD HH:mm:ss","locale":"en","allowInputToggle":true});
        $('.price_per_unit_p').inputmask({"alias":"currency","radixPoint":".","prefix":"","removeMaskOnSubmit":true});
    });

    $('#table-fields').on('click', '.table-field-remove', function(event) {
        $(event.target).closest('tr').remove();
    });

    $('#add-model-relation').click(function (event) {
        $('#model-relations tbody').append($('#model-relation-tpl').html().replace(/__index__/g, $('#model-relations tr').length - 1));
        $('select').select2();
        $('input[type=checkbox]').iCheck({checkboxClass:'icheckbox_minimal-blue'});

        relation_count++;
    });

    $('#model-relations').on('click', '.model-relation-remove', function(event) {
        $(event.target).closest('tr').remove();
    });

    $('#scaffold').on('submit', function (event) {

        //event.preventDefault();

        if ($('#inputTableName').val() == '') {
            $('#inputTableName').closest('.form-group').addClass('has-error');
            $('#table-name-help').removeClass('hide');

            return false;
        }

        return true;
    });
});

</script>
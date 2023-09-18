<?php

namespace App\Admin\Controllers;

use App\Models\JobOrder;
use App\Models\JobOrderDetail;
use App\Models\Invoice;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

use App\Models\Jasa;
use App\Models\Customer;

use Illuminate\Http\Request;
use Illuminate\Support\MessageBag;
use Illuminate\Support\Facades\DB;
Use Encore\Admin\Widgets\Table;
use Illuminate\Support\Facades\Log;

use App\Admin\Actions\JobOrder\Delete;

Use App\Admin\Extensions\JobOrderExporter;

class JobOrderControllers extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(trans('Job Order'))
            // ->description(trans('admin.description'))
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header(trans('admin.detail'))
            ->description(trans('admin.description'))
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        /* return $content
            ->header(trans('admin.edit'))
            ->description(trans('admin.description'))
            ->body($this->form()->edit($id)); */
        
        $action = '/admin/job-order/update/'.$id;
        $data_jo = JobOrder::with('joborderdetail','invoice')->where('id', $id)->first();
        $data_jasa = Jasa::all();
        $data_customer = Customer::all();
        return $content
            ->header(trans('admin.edit'))
            // ->description(trans('admin.description'))
            // ->body($this->form());
            ->body(view('job_order.form-edit', ['action' => $action, 'data_jasa' => $data_jasa, 'data_customer' => $data_customer, 'id' => $id, 'data_jo' => $data_jo]));
    }

    /* public function update(Request $request, $id){
        return $request;
    } */

    public function update(Request $request, $id){
        // return $request;
        DB::beginTransaction();

        try {
            // $q_jo = new JobOrder();
            $q_jo = JobOrder::findOrFail($id);
            $q_jo->nomor_job_order = $request->nomor_job_order;
            $q_jo->customer_id = $request->customer_id;
            $q_jo->price = $request->price;
            $q_jo->mulai_date_riksa = $request->mulai_date_riksa;
            $q_jo->selesai_date_riksa = $request->selesai_date_riksa;
            $q_jo->nomor_po = $request->nomor_po;
            $q_jo->date_pembayaran = $request->date_pembayaran;
            $q_jo->status_pembayaran = $request->status_pembayaran;
            $q_jo->project_by = $request->project_by;
            $q_jo->description = $request->description;
            $q_jo->nama_pengawas = $request->nama_pengawas;
            $q_jo->nohp_pengawas = $request->nohp_pengawas;

            $q_jo->save();
            
            $q_d_jod = JobOrderDetail::where("job_order_id", $id)->forceDelete();

            if ($request->fields) {
                # code...
                
                for ($i=0; $i < count($request->fields); $i++) { 
                    # code...
                    if ($request->fields[$i]['jasa_id'] != "") {
                        # code...
                        if (!is_null($request->fields[$i]['qty'])) {
                            # code...
                            $q_jod = new JobOrderDetail();
                            $q_jod->job_order_id = $q_jo->id;
                            $q_jod->jasa_id = $request->fields[$i]['jasa_id'];
                            $q_jod->qty = $request->fields[$i]['qty'];
                            $q_jod->price_per_unit = $request->fields[$i]['price_per_unit'];
                            $total_price = $request->fields[$i]['qty'] * $request->fields[$i]['price_per_unit'];
                            $q_jod->total_price = $total_price;
                            $q_jod->mulai_date_riksa = $request->fields[$i]['mulai_date_riksa'];
                            $q_jod->selesai_date_riksa = $request->fields[$i]['selesai_date_riksa'];
                            $q_jod->mulai_pengecekan = $request->fields[$i]['mulai_pengecekan'];
                            $q_jod->selesai_pengecekan = $request->fields[$i]['selesai_pengecekan'];
                            $q_jod->description = $request->fields[$i]['description'];
            
                            $q_jod->save();
                        }                        
                    }                    
                }
            }
            

            $q_d_invoice = Invoice::where("job_order_id", $id)->forceDelete();
            if ($request->fields_invoice) {
                # code...
                for ($i=0; $i < count($request->fields_invoice); $i++) { 
                    # code...
                    if ($request->fields_invoice[$i]['nomor_invoice'] != "") {
                        # code...
                        $q_invoice = new Invoice();
                        $q_invoice->job_order_id = $q_jo->id;
                        $q_invoice->nomor_invoice = $request->fields_invoice[$i]['nomor_invoice'];
                        $q_invoice->nilai_tagihan = $request->fields_invoice[$i]['nilai_tagihan'];
                        $q_invoice->value = $request->fields_invoice[$i]['value'];
                        $q_invoice->date_pembayaran = $request->fields_invoice[$i]['date_pembayaran'];
                        $q_invoice->jenis_invoice = $request->fields_invoice[$i]['jenis_invoice'];
                        $q_invoice->description = $request->fields_invoice[$i]['description'];
        
                        $q_invoice->save();
                    }
                    
                }
            }

            

            DB::commit();

            $success = new MessageBag([
                'title'   => 'Success',
                'message' => 'Success Merubah Job Order',
            ]);
        
            // return back()->with(compact('error'));
            return redirect()->route('admin.job-order.index')->with(compact('success'));
            // all good
        } catch (\Exception $e) {
            DB::rollback();

            $error = new MessageBag([
                'title'   => 'Failed',
                'message' => 'Failed Merubah Job Order'. $e,
            ]);
        
            // return back()->with(compact('error'));
            return redirect()->route('admin.job-order.index')->with(compact('error'));
            // something went wrong
        }
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        /* return $content
            ->header(trans('admin.create'))
            ->description(trans('admin.description'))
            ->body($this->form()); */
        $action = '/admin/job-order/store';
        $data_jasa = Jasa::all();
        $data_customer = Customer::all();
        return $content
            ->header(trans('admin.create'))
            ->description("Job Order")
            // ->body($this->form());
            ->body(view('job_order.form', ['action' => $action, 'data_jasa' => $data_jasa, 'data_customer' => $data_customer]));
    }

    /* public function store(Request $request){
        return $request;
    } */

    /* public function store(Request $request){
        return $request->fields_invoice[1]['nomor_invoice'];
    } */

    public function store(Request $request){
        // return $request;

        // Log::debug($request);

        DB::beginTransaction();

        $date = date('Y-m-d');
        $getdatajo = JobOrder::where("created_at", "LIKE", $date.'%')->count();
        if ($getdatajo == 0) {
            # code...
            $getdatajo = 1;
        }
        // return 'SEI/'.date('Y/m/d').'/'.$getdatajo;

        try {
            $q_jo = new JobOrder();
            $q_jo->nomor_job_order = 'SEI/'.date('Y/m/d').'/'.$getdatajo;
            $q_jo->customer_id = $request->customer_id;
            $q_jo->price = (is_null($request->price)) ? 0 : $request->price ;
            /* $q_jo->mulai_date_riksa = $request->mulai_date_riksa;
            $q_jo->selesai_date_riksa = $request->selesai_date_riksa; */
            $q_jo->nomor_po = $request->nomor_po;
            $q_jo->date_pembayaran = $request->date_pembayaran;
            $q_jo->status_pembayaran = $request->status_pembayaran;
            $q_jo->project_by = $request->project_by;
            $q_jo->description = $request->description;
            $q_jo->nama_pengawas = $request->nama_pengawas;
            $q_jo->nohp_pengawas = $request->nohp_pengawas;

            $q_jo->save();

            if (!is_null($request->fields)) {
                # code...
                for ($i=0; $i < count($request->fields); $i++) { 
                    # code...
                    if (!is_null($request->fields[$i]['qty'])) {
                        # code...
                        $q_jod = new JobOrderDetail();
                        $q_jod->job_order_id = $q_jo->id;
                        $q_jod->jasa_id = $request->fields[$i]['jasa_id'];
                        $q_jod->qty = $request->fields[$i]['qty'];
                        $q_jod->price_per_unit = $request->fields[$i]['price_per_unit'];
                        $total_price = $request->fields[$i]['qty'] * $request->fields[$i]['price_per_unit'];
                        $q_jod->total_price = $total_price;
                        $q_jod->mulai_date_riksa = $request->fields[$i]['mulai_date_riksa'];
                        $q_jod->selesai_date_riksa = $request->fields[$i]['selesai_date_riksa'];
                        $q_jod->mulai_pengecekan = $request->fields[$i]['mulai_pengecekan'];
                        $q_jod->selesai_pengecekan = $request->fields[$i]['selesai_pengecekan'];
                        $q_jod->description = $request->fields[$i]['description'];        
                        $q_jod->save();
                    }                    
                }
            }
            if ($request->fields_invoice) {
                # code...
                for ($invo=0; $invo < count($request->fields_invoice); $invo++) { 
                    # code...
                    if (!is_null($request->fields_invoice[$invo]['nomor_invoice'])) {
                        # code...
                        $q_invoice = new Invoice();
                        $q_invoice->job_order_id = $q_jo->id;
                        $q_invoice->nomor_invoice = $request->fields_invoice[$invo]['nomor_invoice'];
                        $q_invoice->nilai_tagihan = $request->fields_invoice[$invo]['nilai_tagihan'];
                        $q_invoice->value = $request->fields_invoice[$invo]['value'];
                        $q_invoice->date_pembayaran = $request->fields_invoice[$invo]['date_pembayaran'];
                        $q_invoice->jenis_invoice = $request->fields_invoice[$invo]['jenis_invoice'];
                        $q_invoice->description = $request->fields_invoice[$invo]['description'];        
                        $q_invoice->save();
                    }                    
                }
            }
            DB::commit();

            $success = new MessageBag([
                'title'   => 'Success',
                'message' => 'Success Menambahkan Job Order',
            ]);
        
            // return back()->with(compact('error'));
            return redirect()->route('admin.job-order.index')->with(compact('success'));
            // all good
        } catch (\Exception $e) {
            DB::rollback();

            $error = new MessageBag([
                'title'   => 'Failed',
                'message' => 'Failed Menambahkan Job Order'. $e,
            ]);
        
            // return back()->with(compact('error'));
            return redirect()->route('admin.job-order.index')->with(compact('error'));
            // something went wrong
        }
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        
        $grid = new Grid(new JobOrder);
        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->like('nomor_job_order', 'No. Job Order');
            $filter->where(function ($query) {
                $query->whereHas('customer', function ($query) {
                    $query->where('fullname', 'like', "%{$this->input}%")->orWhere('address', 'like', "%{$this->input}%");
                });            
            }, 'Customer Name Or Customer Address');
            $filter->between('created_at', 'Created Time')->datetime();
            // $filter->between('mulai_date_riksa', 'Mulai Riksa')->datetime();
            // $filter->between('selesai_date_riksa', 'Selesai Riksa')->datetime();
            $filter->between('date_pembayaran', 'TGL. Pelunasan')->datetime();
            $filter->equal('status_pembayaran')->radio([
                ''   => 'All',
                0    => 'Belum Ada Pembayaran',
                1    => 'Setengah Pembayaran',
                2    => 'Sudah Lunas',
            ]);
        });

        $grid->actions(function ($actions) {
            // $actions->append('<a href="/admin/job-order/delete/'.$actions->getKey().'">TESSSS</a>');
            $actions->add(new Delete);
            $actions->disableView();
            $actions->disableDelete();
            
        });

        $grid->tools(function ($tools) {
            $tools->batch(function ($batch) {
                $batch->disableDelete();
            });
        });
        

        $grid->export(function ($export) {    
            $export->originalValue(['price', 'nomor_po', 'date_pembayaran', 'project_by', 'nama_pengawas', 'nohp_pengawas', 'description']);
            $export->column('status_pembayaran', function ($value, $original) {
                /* if ($original == 1) {
                    # code...
                    return "Sudah Bayar";
                }else{
                    return "Belum Bayar";
                } */

                if ($original == 2) {
                    # code...
                    return "Sudah Lunas";
                }elseif ($original == 1) {
                    # code...
                    return "Setengah Pembayaran";
                }elseif ($original == 0) {
                    # code...
                    return "Belum Ada Pembayaran";
                }
            });
            $export->except(['lihat_jasa_for_grid', 'lihat_invoice_for_grid']);
        });

        // $grid->exporter(new JobOrderExporter());

        // $grid->id('ID');
        $grid->nomor_job_order('No. Job Order');
        // $grid->customer_id('customer_id');
        $grid->customer()->fullname('Customer');
        $grid->customer()->address('Customer Address');
        // $grid->price('Price');
        $grid->column('price')->display(function ($price){
            return number_format($price, 2);
        })->editable();
        // $grid->mulai_date_riksa('TGL. Mulai Riksa')->date('Y-m-d');
        // $grid->selesai_date_riksa('TGL. Selesai Riksa')->date('Y-m-d');
        $grid->nomor_po('NO. PO.')->editable();
        $grid->date_pembayaran('TGL. Rencana Pelunasan')->date('Y-m-d');
        $grid->column('status_pembayaran', 'Status Peluanasan')->display(function ($status_pembayaran) {

            // return "<span style='color:blue'>$title</span>";
            /* if ($status_pembayaran == 1) {
                # code...
                return "Sudah Bayar";
            }else{
                return "Belum Bayar";
            } */

            if ($status_pembayaran == 2) {
                # code...
                return "Sudah Lunas";
            }elseif ($status_pembayaran == 1) {
                # code...
                return "Setengah Pembayaran";
            }elseif ($status_pembayaran == 0) {
                # code...
                return "Belum Ada Pembayaran";
            }
        
        });
        $grid->project_by('Project By')->editable();
        $grid->nama_pengawas('Nama Pengawas')->editable();
        $grid->nohp_pengawas('NO. HP. Pengawas')->editable();
        $grid->description('Description')->editable();
        $grid->created_at(trans('admin.created_at'));
        $grid->column('lihat_jasa_for_grid', 'Lihat Jasa')->modal('Jasa Job Order', function ($model) {

            $jod = $model->joborderdetail()->get()->map(function ($jod) {
                $cari_jasa = Jasa::find($jod->jasa_id);
                $nama_jasa = "";
                if ($cari_jasa) {
                    # code...
                    $nama_jasa = $cari_jasa->nama;
                }else{
                    $nama_jasa = "Tidak Ditemukan";
                }
                $price = number_format($jod->price_per_unit, 2);
                
                $data = array('mark' => '-', 
                                'nama_jasa' => $nama_jasa, 
                                'qty' => $jod->qty, 
                                'price' => $price, 
                                'total_price' => number_format($jod->qty * $jod->price_per_unit, 2), 
                                'mulai_date_riksa' => $jod->mulai_date_riksa,// Mulai Riksa
                                'selesai_date_riksa' => $jod->selesai_date_riksa,// Selesai Laporan
                                'mulai_pengecekan' => $jod->mulai_pengecekan,// Naik Suket
                                'selesai_pengecekan' => $jod->selesai_pengecekan,// Suket Selesai
                                'created_at' => $jod->created_at);

                return $data;
            });
        
            return new Table(['', 'Nama Jasa', 'Qty', 'Price', 'Total Price', 'Mulai Riksa', 'Selesai Laporan', 'Naik Suket', 'Suket Selesai', ''], $jod->toArray());

            // return $jod;
        });
        $grid->column('lihat_invoice_for_grid','Lihat Invoice')->modal('Invoice Job Order', function ($model) {
            $invoice = $model->invoice()->get()->map(function ($invoice) {
                $jenis_invoice = "";
                if ($invoice->jenis_invoice == 0) {
                    # code...
                    $jenis_invoice = "DP";
                }else{
                    $jenis_invoice = "Invoice Pelunasan";
                }                
                $data = array('mark' => '-', 'nomor_invoice' => $invoice->nomor_invoice, 'nilai_tagihan' => number_format($invoice->nilai_tagihan, 2), 'value' => number_format($invoice->value, 2), 'jenis_invoice' => $jenis_invoice);
                return $data;
            });
            return new Table(['', 'Nomor Invoice', 'Nilai Tagihan', 'Value', 'Jenis Invoice'], $invoice->toArray());
            // return $jod;
        });
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(JobOrder::findOrFail($id));

        $show->id('ID');
        $show->nomor_job_order('nomor_job_order');
        $show->customer_id('customer_id');
        $show->price('price');
        $show->mulai_date_riksa('mulai_date_riksa');
        $show->selesai_date_riksa('selesai_date_riksa');
        $show->nomor_po('nomor_po');
        $show->date_pembayaran('date_pembayaran');
        $show->status_pembayaran('status_pembayaran');
        $show->project_by('project_by');
        $show->description('description');
        $show->created_at(trans('admin.created_at'));
        $show->updated_at(trans('admin.updated_at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new JobOrder);

        $form->display('ID');
        $form->text('nomor_job_order', 'nomor_job_order');
        $form->text('customer_id', 'customer_id');
        $form->text('price', 'price');
        $form->text('mulai_date_riksa', 'mulai_date_riksa');
        $form->text('selesai_date_riksa', 'selesai_date_riksa');
        $form->text('nomor_po', 'nomor_po');
        $form->text('date_pembayaran', 'date_pembayaran');
        $form->text('status_pembayaran', 'status_pembayaran');
        $form->text('project_by', 'project_by');
        $form->text('description', 'description');
        $form->display(trans('admin.created_at'));
        $form->display(trans('admin.updated_at'));

        return $form;
    }

    public function delete($id){
        dd($id);
    }

    
}

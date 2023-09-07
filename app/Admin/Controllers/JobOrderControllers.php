<?php

namespace App\Admin\Controllers;

use App\Models\JobOrder;
use App\Models\JobOrderDetail;
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
        $data_jo = JobOrder::with('joborderdetail')->where('id', $id)->first();
        $data_jasa = Jasa::all();
        $data_customer = Customer::all();
        return $content
            ->header(trans('admin.edit'))
            // ->description(trans('admin.description'))
            // ->body($this->form());
            ->body(view('job_order.form-edit', ['action' => $action, 'data_jasa' => $data_jasa, 'data_customer' => $data_customer, 'id' => $id, 'data_jo' => $data_jo]));
    }

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

            $q_jo->save();

            $q_d_jod = JobOrderDetail::where("job_order_id", $id)->delete();

            for ($i=0; $i < count($request->fields); $i++) { 
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
            ->description(trans('admin.description'))
            // ->body($this->form());
            ->body(view('job_order.form', ['action' => $action, 'data_jasa' => $data_jasa, 'data_customer' => $data_customer]));
    }

    public function store(Request $request){
        // return $request;

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
            $q_jo->price = $request->price;
            $q_jo->mulai_date_riksa = $request->mulai_date_riksa;
            $q_jo->selesai_date_riksa = $request->selesai_date_riksa;
            $q_jo->nomor_po = $request->nomor_po;
            $q_jo->date_pembayaran = $request->date_pembayaran;
            $q_jo->status_pembayaran = $request->status_pembayaran;
            $q_jo->project_by = $request->project_by;
            $q_jo->description = $request->description;

            $q_jo->save();

            for ($i=0; $i < count($request->fields); $i++) { 
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
            $filter->between('mulai_date_riksa', 'Mulai Riksa')->datetime();
            $filter->between('selesai_date_riksa', 'Selesai Riksa')->datetime();
            $filter->between('date_pembayaran', 'TGL. Pembayaran')->datetime();
            $filter->equal('status_pembayaran')->radio([
                ''   => 'All',
                0    => 'Belum Bayar',
                1    => 'Sudah Bayar',
            ]);
        });

        $grid->actions(function ($actions) {
            $actions->disableView();
        });

        $grid->export(function ($export) {        
            $export->except(['']);
        });

        // $grid->id('ID');
        $grid->nomor_job_order('No. Job Order');
        // $grid->customer_id('customer_id');
        $grid->customer()->fullname('Customer');
        // $grid->price('Price');
        $grid->column('price')->display(function ($price){
            return number_format($price, 2);
        })->editable();
        $grid->mulai_date_riksa('TGL. Mulai Riksa')->date('Y-m-d');
        $grid->selesai_date_riksa('TGL. Selesai Riksa')->date('Y-m-d');
        $grid->nomor_po('NO. PO.')->editable();
        $grid->date_pembayaran('TGL. Pembayaran')->date('Y-m-d');
        $grid->column('status_pembayaran')->display(function ($status_pembayaran) {

            // return "<span style='color:blue'>$title</span>";
            if ($status_pembayaran == 1) {
                # code...
                return "Sudah Bayar";
            }else{
                return "Belum Bayar";
            }
        
        });
        $grid->project_by('Project By')->editable();
        $grid->description('Description')->editable();
        $grid->created_at(trans('admin.created_at'));
        $grid->column('', 'Lihat Jasa')->modal('Jasa Job Order', function ($model) {

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
                
                $data = array('mark' => '-', 'nama_jasa' => $nama_jasa, 'qty' => $jod->qty, 'price' => $price, 'total_price' => number_format($jod->qty * $jod->price_per_unit, 2), 'created_at' => $jod->created_at);

                return $data;
            });
        
            return new Table(['', 'Nama Jasa', 'Qty', 'Price', 'Total Price', ''], $jod->toArray());

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
}

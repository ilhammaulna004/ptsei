<?php

namespace App\Admin\Controllers;

use App\Models\Invoice;
use App\Models\JobOrder;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class InvoiceControllers extends Controller
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
            ->header("Report")
            ->description("Invoice")
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
        return $content
            ->header(trans('admin.edit'))
            ->description(trans('admin.description'))
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header(trans('admin.create'))
            ->description(trans('admin.description'))
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Invoice);

        $grid->filter(function ($filter) {

        $filter->disableIdFilter();

        $filter->where(function ($query) {
            $query->whereHas('job_order', function ($query) {
                $query->where('nomor_job_order', 'like', "%{$this->input}%");
            });            
        }, 'Nomor Job Order');
        $filter->where(function ($query) {
            $query->whereHas('job_order', function ($query) {
                $query->whereHas('customer', function ($qc){
                    $qc->where('fullname', 'like', "%{$this->input}%")->orWhere('address', 'like', "%{$this->input}%");
                });                    
            });            
        }, 'Customer');
        $filter->between('nilai_tagihan', 'Nilai Tagihan');
        $filter->between('value', 'Value');            
        $filter->between('date_pembayaran', 'TGL Pembayaran')->datetime();
        $filter->equal('jenis_invoice')->radio([
            '' => 'All',
            0 => 'Invoice DP',
            1 => 'Invoice Pelunasan',
        ]);
        $filter->where(function ($query) {
            $query->whereHas('job_order', function ($query) {
                $query->where('status_pembayaran', "{$this->input}");
            });            
        }, 'Status Pemabayaran')->radio([
            ''   => 'All',
            0    => 'Belum Ada Pembayaran',
            1    => 'Setengah Pembayaran',
            2    => 'Sudah Lunas',
        ]);
        $filter->like('description', 'Description');
        $filter->between('created_at', 'Created Time')->datetime();
        });

        $grid->disableActions();

        $grid->disableCreateButton();

        $grid->disableRowSelector();

        $grid->disableColumnSelector();

        $grid->actions(function (Grid\Displayers\Actions $actions) {
            $actions->disableView();
            $actions->disableEdit();
            $actions->disableDelete();
        });

        // $grid->id('ID');
        // $grid->job_order_id('job_order_id');
        $grid->job_order()->nomor_job_order('Job Order');
        $grid->column('job_order_id', 'Customer & Address')->display(function ($job_order_id) {
            $customer = JobOrder::with('customer')->find($job_order_id);
            return $customer->customer->fullname." (".$customer->customer->address.")";        
        });
        $grid->nomor_invoice('NO. Invoice');
        $grid->nilai_tagihan('Nilai Tagihan')->display(function ($nilai_tagihan){
            return number_format($nilai_tagihan, 2);
        });
        $grid->value('Value')->display(function ($value){
            return number_format($value, 2);
        });
        $grid->date_pembayaran('TGL. Pembayaran');
        $grid->jenis_invoice('Jenis Invoice')->display(function ($jenis_invoice){
            if ($jenis_invoice == 1) {
                # code...
                return "Invoice Pelunasan";
            }else{
                return "Invoice DP";
            }
            // return $jenis_invoice;
        });
        $grid->description('Description');
        $grid->created_at(trans('admin.created_at'));
        // $grid->updated_at(trans('admin.updated_at'));

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
        $show = new Show(Invoice::findOrFail($id));

        $show->id('ID');
        $show->job_order_id('job_order_id');
        $show->nomor_invoice('nomor_invoice');
        $show->nilai_tagihan('nilai_tagihan');
        $show->value('value');
        $show->date_pembayaran('date_pembayaran');
        $show->jenis_invoice('jenis_invoice');
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
        $form = new Form(new Invoice);

        $form->display('ID');
        $form->text('job_order_id', 'job_order_id');
        $form->text('nomor_invoice', 'nomor_invoice');
        $form->text('nilai_tagihan', 'nilai_tagihan');
        $form->text('value', 'value');
        $form->text('date_pembayaran', 'date_pembayaran');
        $form->text('jenis_invoice', 'jenis_invoice');
        $form->text('description', 'description');
        $form->display(trans('admin.created_at'));
        $form->display(trans('admin.updated_at'));

        return $form;
    }
}

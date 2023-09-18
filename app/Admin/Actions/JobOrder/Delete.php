<?php

namespace App\Admin\Actions\JobOrder;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

use App\Models\JobOrder;
use App\Models\JobOrderDetail;
use App\Models\Invoice;
use Illuminate\Support\Facades\DB;

class Delete extends RowAction
{
    public $name = 'Delete';

    public function handle(Model $model)
    {
        // $model ...

        DB::beginTransaction();

        try {
            
            JobOrderDetail::where('job_order_id', $model->id)->delete();
            Invoice::where('job_order_id', $model->id)->delete();
            JobOrder::find($model->id)->delete();

            DB::commit();
            // all good

            return $this->response()->success('Success Delete')->refresh();
        } catch (\Exception $e) {
            DB::rollback();
            // something went wrong

            return $this->response()->error('Error '. $e)->refresh();
        }

        
    }

}
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class JobOrderDetail extends Model
{
    use SoftDeletes;

    protected $table = 'job_order_detail';

    public function job_order()
    {
        return $this->belongsTo(JobOrder::class);
    }

    public function jasa()
    {
        return $this->belongsTo(Jasa::class);
    }

    
}

<?php

class Premio extends \WeDevs\ORM\Eloquent\Model
{
    use traits\ModelUpsertAuxAttributes;

    /**
     * Name for table without prefix
     *
     * @var string
     */
    protected $table = 'wp_pa_premio' ;

    /**
     * Columns that can be edited - IE not primary key or timestamps if being used
     */
    protected $fillable = [];

    /**
     * Disable created_at and update_at columns, unless you have those.
     */
    public $timestamps = false;

    /** Everything below this is best done in an abstract class that custom tables extend */

    /**
     * Set primary key as ID, because WordPress
     *
     * @var string
     */
    protected $primaryKey = 'prem_id';

    /**
     * Make ID guarded -- without this ID doesn't save.
     *
     * @var string
     */
    protected $guarded = [];

    //--------------------------------------------------------------------------

    public function attributePrefix()
    {
        return 'prem_';
    }
}
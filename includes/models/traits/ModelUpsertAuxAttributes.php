<?php

namespace traits;
trait ModelUpsertAuxAttributes
{
    /**
     * @return bool
     * */
    public function upsert()
    {
        $current_user = wp_get_current_user();
        $prefix = $this->attributePrefix();
        $att = $this->getAttributes();
        $pk = isset($att[$prefix . 'id']);

        $this->setAttribute($prefix . 'editor', $current_user->ID);
        $this->setAttribute($prefix . 'editado', date("Y-m-d H:i:s"));

        if ($pk) {
            // Update
            return $this->update($att);
        } else {
            // Create
            $this->setAttribute($prefix . 'creador', $current_user->ID);
            $this->setAttribute($prefix . 'creado', date("Y-m-d H:i:s"));
            return $this->save();
        }
    }
}
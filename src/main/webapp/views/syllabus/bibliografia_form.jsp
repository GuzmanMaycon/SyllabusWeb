<div class="row" v-cloak>
    <div class="col-xs-12 col-sm-4 col-lg-5">
        <div class="col-xs-4">
            <div class="text-center">
                <label class="label-ref">Autor(es)</label>
            </div>
        </div>
        <div class="col-xs-8">
            <input class="input-ref"
                   v-model="new_ref_autor"
                   id="new_ref_autor"
                   v-show="!(ref_selected.id)">
            <input class="input-ref"
                   v-model="edit_ref_autor"
                   id="edit-ref-autor"
                   data-id=""
                   v-show="ref_selected.id">
        </div>
    </div>

    <div class="col-xs-12 col-sm-4 col-lg-2">
        <div class="col-xs-4">
            <div class="text-center">
                <label class="label-ref">Año</label>
            </div>
        </div>
        <div class="col-xs-8">
            <input class="input-ref"
                   v-model="new_ref_anio"
                   id="new_ref_anio"
                   v-show="!(ref_selected.id)">
            <input class="input-ref"
                   v-model="edit_ref_anio"
                   id="edit-ref-anio"
                   v-show="ref_selected.id">
        </div>
    </div>

    <div class="col-xs-12 col-sm-4 col-lg-5">
        <div class="col-xs-4">
            <div class="text-center">
                <label class="label-ref">Título</label>
            </div>
        </div>
        <div class="col-xs-8">
            <input class="input-ref"
                   v-model="new_ref_titulo"
                   id="new_ref_titulo"
                   v-show="!(ref_selected.id)">
            <input class="input-ref"
                   v-model="edit_ref_titulo"
                   id="edit-ref-titulo"
                   v-show="ref_selected.id">
        </div>
    </div>
</div>

<div class="row row-ref" v-cloak>
    <div class="col-xs-12 col-sm-4 col-lg-4">
        <div class="col-xs-4">
            <div class="text-center">
                <label class="label-ref">Editorial</label>
            </div>
        </div>
        <div class="col-xs-8">
            <input class="input-ref"
                   v-model="new_ref_editorial"
                   id="new-ref-editorial"
                   v-show="!(ref_selected.id)">
            <input class="input-ref"
                   v-model="edit_ref_editorial"
                   id="edit-ref-editorial"
                   v-show="ref_selected.id">
        </div>
    </div>

    <div class="col-xs-12 col-sm-5 col-lg-3">
        <div class="col-xs-4">
            <div class="text-center">
                <label class="label-ref">ISBN-13</label>
            </div>
        </div>
        <div class="col-xs-8">
            <input class="input-ref"
                   v-model="new_ref_isbn"
                   id="new-ref-isbn"
                   v-show="!(ref_selected.id)">
            <input class="input-ref"
                   v-model="edit_ref_isbn"
                   id="edit-ref-isbn"
                   v-show="ref_selected.id">
        </div>
    </div>

    <div class="col-xs-12 col-sm-3 col-lg-2">
        <div class="text-center add-ref-container">
            <a class="btn btn-success"
               @click="add_ref_bibliografica()"
               v-show="!(ref_selected.id)"
               title="Agregar Referencia Bibliografica">
                <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
            </a>
            <a class="btn btn-default"
               v-show="ref_selected.id"
               @click="actualizar_ref(ref_selected)">
               <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
            </a>
            <a class="btn btn-warning"
               v-show="ref_selected.id"
               @click="cancelar_actualizar_ref()">
               <span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>
            </a>
        </div>
    </div>
</div>

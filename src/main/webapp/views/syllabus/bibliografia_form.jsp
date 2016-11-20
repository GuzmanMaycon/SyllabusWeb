<div class="row" v-cloak>
  <div class="col-xs-12 col-sm-4 col-lg-5">
    <div class="col-xs-4">
      <div class="text-center">
        <label class="label-ref">Autor(es)</label>
      </div>
    </div>

    <div class="col-xs-8">
      <input class="input-ref"
             v-model="newRefAutor"
             id="newRefAutor"
             v-show="!(ref_selected.id)">
      <input class="input-ref"
             v-model="editRefAutor"
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
             v-model="newRefAnio"
             id="newRefAnio"
             v-show="!(ref_selected.id)">
      <input class="input-ref"
             v-model="editRefAnio"
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
             v-model="newRefTitulo"
             id="newRefTitulo"
             v-show="!(ref_selected.id)">
      <input class="input-ref"
             v-model="editRefTitulo"
             id="edit-ref-titulo"
             v-show="ref_selected.id">
    </div>
  </div>
</div>

<div class="row row-ref" v-cloak>
  <div class="col-xs-12 col-sm-4 col-lg-3">
    <div class="col-xs-4">
      <div class="text-center">
        <label class="label-ref">Editorial</label>
      </div>
    </div>

    <div class="col-xs-8">
      <input class="input-ref"
             v-model="newRefEditorial"
             id="new-ref-editorial"
             v-show="!(ref_selected.id)">
      <input class="input-ref"
             v-model="editRefEditorial"
             id="edit-ref-editorial"
             v-show="ref_selected.id">
    </div>
  </div>

  <div class="col-xs-12 col-sm-5 col-lg-4">
    <div class="col-xs-4">
      <div class="text-center">
        <label class="label-ref">ISBN</label>
      </div>
    </div>

    <div class="col-xs-8">
      <input class="input-ref"
             v-model="newRefIsbn"
             id="new-ref-isbn"
             v-show="!(ref_selected.id)">
      <input class="input-ref"
             v-model="editRefIsbn"
             id="edit-ref-isbn"
             v-show="ref_selected.id">
    </div>
  </div>

  <div class="col-xs-12 col-sm-4 col-lg-3">
    <div class="col-xs-4">
      <div class="text-center">
        <label class="label-ref">Lugar</label>
      </div>
    </div>

    <div class="col-xs-8">
      <input class="input-ref"
             v-model="newRefLugar"
             id="new-ref-lugar"
             v-show="!(ref_selected.id)">
      <input class="input-ref"
             v-model="editRefLugar"
             id="edit-ref-lugar"
             v-show="ref_selected.id">
    </div>
  </div>

  <div class="col-xs-12 col-sm-3 col-lg-2">
    <div class="text-center add-ref-container">
      <a class="btn btn-success"
         @click="addRefBibliografica()"
         v-show="!(ref_selected.id)"
         title="Agregar Referencia Bibliografica">
        <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
      </a>
      <a class="btn btn-default"
         v-show="ref_selected.id"
         @click="actualizarRef(ref_selected)">
         <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
      </a>
      <a class="btn btn-warning"
         v-show="ref_selected.id"
         @click="cancelarActualizarRef()">
         <span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>
        </a>
    </div>
  </div>
</div>

<div id="unidades">
  <div class="clickable unidad"
    id="unidad_{{ unidad.id }}"
    v-for="unidad in unidades"
    @click="selectUnidad(unidad)"
  >
    <p>
      <span>Unidad {{ unidad.number }}</span>
      <a type="button"
         class="btn btn-danger float-right"
         v-show="unidadSelected == unidad"
         title="Eliminar"
         @click="deleteUnidad(unidad)"
      >
        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
      </a>
    </p>
  </div>
</div>
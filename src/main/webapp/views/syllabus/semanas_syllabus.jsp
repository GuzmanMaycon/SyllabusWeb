<h4><i>{{ unidadSelected.name }}</i></h4>
<div id="semanas">
  <div class="clickable semana"
     id="semana_{{ semana.id }}"
     v-for="semana in semanasUnidadSelected(unidadSelected)"
     @click="selectSemana(semana)"
  >
    <p>
      <span>Semana {{ semana.number }}</span>
      <a type="button"
         class="btn btn-danger float-right"
         v-show="semanaSelected == semana"
         title="Eliminar"
         @click="deleteSemana(semana)"
      >
        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
      </a>
    </p>
  </div>
</div>
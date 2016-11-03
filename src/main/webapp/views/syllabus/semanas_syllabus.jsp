<h4><i>{{ unidad_selected.name }}</i></h4>
<div id="semanas">
    <div class="clickable semana"
         id="semana_{{ semana.id }}"
         v-for="semana in semanasUnidadSeledted(unidad_selected)"
         @click="select_semana(semana)"
    >
        <p>
            <span>Semana {{ semana.number }}</span>
            <a type="button"
               class="btn btn-danger float-right"
               v-show="semana_selected == semana"
               title="Eliminar"
               @click="delete_semana(semana)"
            >
              <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
            </a>
        </p>
    </div>
</div>
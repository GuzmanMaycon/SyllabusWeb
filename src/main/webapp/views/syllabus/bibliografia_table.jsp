<table class="table table-responsive">
  <thead>
    <th>Autor(es)</th>
    <th class="hidden-xs hidden-sm">A�o de publicaci�n</th>
    <th class="visible-xs visible-sm">A�o</th>
    <th>T�tulo</th>
    <th class="hidden-xs hidden-sm">Editorial</th>
    <th class="hidden-xs hidden-sm">ISBN-13</th>
    <th class="hidden-xs hidden-sm">Lugar de publicaci�n</th>
    <th class="visible-xs visible-sm">Lugar</th>
    <th></th>
  </thead>
  <tbody>
    <tr v-for="ref in refBibliografica"
      id="ref_{{ ref.id }}"
      class="clickable"
      @click="addBindingRef(ref)">
      <td>{{ ref.author }}</td>
      <td>{{ ref.year }}</td>
      <td>{{ ref.title }}</td>
      <td class="hidden-xs hidden-sm">{{ ref.editorial }}</td>
      <td class="hidden-xs hidden-sm">{{ ref.isbn }}</td>
      <td class="hidden-xs hidden-sm">{{ ref.lugar }}</td>
      <td>
        <a class="btn btn-danger"
           title="Eliminar"
           @click="deleteRefBibliografica(ref)">
          <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
        </a>
      </td>
    </tr>
  </tbody>
</table>
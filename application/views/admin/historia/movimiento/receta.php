<div id="HistoriaContenidoReceta" class="panel panel-primary" style="display: none">
  <div class="panel-heading">Receta</div>
  <div class="panel-body">
    <div class="row">
      <div class="col-md-12">
        <div class="form-group">
          <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#ModalAgregarReceta"><i class="fa fa-plus" aria-hidden="true"></i> Agregar</button>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <table id="TableHistoriaMovimientoRecetas" class="table table-bordered">
          <thead>
            <tr class="btn-primary btn-xs">
              <th style="text-align: center;">Fecha</th>
              <th  style="text-align: center;">Asunto</th>
              <th  style="text-align: center;">Médico</th>
              <th  style="text-align: center;">Diagnostico</th>
              <th  style="text-align: center;">Opciones</th>
            </tr>
          </thead>
          <tbody>
            
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>


<div id="ModalAgregarReceta" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content ">
      <form id="FormHistoriaMovimientoAgregarReceta" action="<?= base_url('historia/movimiento/agregarReceta') ?>" method="post" autocomplete="off">
        <input type="hidden" name="paciente" value="<?= $this->uri->segment(4) ?>">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Agregar Receta</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-6">
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label class="control-label">H.C: <?= $this->uri->segment(4) ?></label>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label class="control-label">Edad: <?= edad($paciente->fena_pac) ?> años</label>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label class="control-label">Fecha:</label>
                    <input type="text" name="fecha" class="form-control input-sm" value="<?= date('Y-m-d') ?>" readonly>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label class="control-label">Hora:</label>
                    <input type="text" name="hora" class="form-control input-sm" value="<?= date('H:i:s') ?>" readonly>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Asunto:</label>
                    <input type="text" name="asunto" class="form-control input-sm">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Receta:</label>
                    <textarea name="receta" class="form-control input-sm" rows="5"></textarea>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Medico:</label>
                    <input type="text" name="medico" class="form-control input-sm" value="<?= $this->session->userdata('nombre').' '.$this->session->userdata('apellido') ?>" disabled>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Diagnostico 01:</label>
                    <select name="diagnostico01" class="form-control select2" style="width: 100%">
                      <option value=""></option>
                      <?php foreach ($diagnosticos as $d): ?>
                      <option value="<?= $d->codi_enf ?>"><?= $d->desc_enf ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Diagnostico 02:</label>
                    <select name="diagnostico02" class="form-control select2" style="width: 100%">
                      <option value=""></option>
                      <?php foreach ($diagnosticos as $d): ?>
                      <option value="<?= $d->codi_enf ?>"><?= $d->desc_enf ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Diagnostico 03:</label>
                    <select name="diagnostico03" class="form-control select2" style="width: 100%">
                      <option value=""></option>
                      <?php foreach ($diagnosticos as $d): ?>
                      <option value="<?= $d->codi_enf ?>"><?= $d->desc_enf ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Indicaciones:</label>
                    <textarea name="indicaciones" class="form-control input-sm" rows="5"></textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Cancelar</button>
          <button type="submit" class="btn btn-info"><i class="fa fa-save"></i> Guardar</button>
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div id="ModalEditarReceta" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content ">
      <form id="FormHistoriaMovimientoEditarReceta" action="<?= base_url('historia/movimiento/editarReceta') ?>" method="post" autocomplete="off">
        <input type="hidden" name="paciente" value="<?= $this->uri->segment(4) ?>">
        <input type="hidden" name="id" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Editar Receta</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-6">
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label class="control-label">H.C: <?= $this->uri->segment(4) ?></label>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label class="control-label">Edad <?= edad($paciente->fena_pac) ?> años</label>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label class="control-label">Fecha</label>
                    <input type="text" name="fecha" class="form-control input-sm" value="<?= date('Y-m-d') ?>" readonly>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label class="control-label">Hora</label>
                    <input type="text" name="hora" class="form-control input-sm" value="<?= date('H:i:s') ?>" readonly>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Asunto</label>
                    <input type="text" name="asunto" class="form-control input-sm">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Receta</label>
                    <textarea name="receta" class="form-control input-sm" rows="5"></textarea>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Medico</label>
                    <input type="text" name="medico"  disabled class="form-control input-sm" value="<?= $this->session->userdata('nombre').' '.$this->session->userdata('apellido') ?>">
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Diagnostico 01</label>
                    <select name="diagnostico01" class="form-control select2" style="width: 100%">
                      <option value=""></option>
                      <?php foreach ($diagnosticos as $d): ?>
                      <option value="<?= $d->codi_enf ?>"><?= $d->desc_enf ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Diagnostico 02</label>
                    <select name="diagnostico02" class="form-control select2" style="width: 100%">
                      <option value=""></option>
                      <?php foreach ($diagnosticos as $d): ?>
                      <option value="<?= $d->codi_enf ?>"><?= $d->desc_enf ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Diagnostico 03</label>
                    <select name="diagnostico03" class="form-control select2" style="width: 100%">
                      <option value=""></option>
                      <?php foreach ($diagnosticos as $d): ?>
                      <option value="<?= $d->codi_enf ?>"><?= $d->desc_enf ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label class="control-label">Indicaciones</label>
                    <textarea name="indicaciones" class="form-control input-sm" rows="5"></textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Cancelar</button>
          <button type="submit" class="btn btn-info"><i class="fa fa-save"></i> Guardar</button>
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

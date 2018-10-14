// Aktueller Monat --------------------------------------------
  var jetzt = new Date();
  var Jahr = jetzt.getFullYear();
  var Monat = jetzt.getMonth() + 1;
  var _Monat = "";
  if(Monat.toString().length <= 1){
      _Monat = '0' + Monat + Jahr;
  } else{
      _Monat = Monat + '' + Jahr;
  }
  var _Time = jetzt.getTime();


  /*
   * ******************** Upload-Function ************************
   * -------------------------------------------------------------
   */

  isc.defineClass('UploadForm', 'DynamicForm');
  UploadForm.addClassProperties({
      create: function(data){

          // We are creating IFRAME that will work as a target for upload.
          var iframeCanvas = Canvas.getById('uploadFormIframe');
          if(!iframeCanvas){
              Canvas.create({
                  ID: "uploadFormIframe",
                  contents: "<iframe name=\"uploadFormIframe\"></iframe>",
                  autoDraw: true,
                  visibility: "hidden"
              });
          }

          // parameters needed to submit a form
          isc.addProperties(data, {
              encoding: "multipart",
              canSubmit: "true",
              target: "uploadFormIframe"
          });
          // special field that will hold form's ID
          data.fields.push({
              name: "uploadFormID",
              type: "hidden"
          });
          // We are creating a form.
          var f = this.Super('create', data);
          // We are setting special field to an ID of newly created form.
          f.setValue('uploadFormID', f.getID());
          return f;
      }
  });
  /*
   * ******************** DropZone *******************************
   * -------------------------------------------------------------
   */
  function drop(drop_zone, _form, _status, _list){// wird beim öffnen des Upload-Fensters gestartet
      var dropZone = document.getElementById(drop_zone);
      dropZone.addEventListener('dragover', handleDragOver, false);
      dropZone.addEventListener('drop', uploadFile(_form, _status, _list), false);
      document.getElementById(_status).innerHTML = "";
      document.getElementById(_list).innerHTML = "";
  }

  function handleDragOver(event){
      event.stopPropagation();
      event.preventDefault();
      var dt = event.dataTransfer;
      dt.dropEffect = 'copy'; // Explicitly show this is a copy.

  }

  function uploadFile(_form, _status, _list)
  {
      return function(event){ //callback
          event.stopPropagation();
          event.preventDefault();
          var files = event.dataTransfer.files; // FileList object.

          // files is a FileList of File objects. List some properties.
          var output = [];
          
          for(var i = 0, f; f = files[i]; i++){
              output.push('<li><strong>', f.name, '</strong> - ', f.size, ' bytes </li>');
              //  uploadFile(f, event);

              var xhr = new XMLHttpRequest();    // den AJAX Request anlegen
              // Angeben der URL und des Requesttyps
              xhr.open('POST', 'api/media_upload.php'); // Die Verbindung wird geöffnet
              xhr.responseType = "json";
              var formdata = new FormData();    // Anlegen eines FormData Objekts zum Versenden unserer Datei
              var typ = _form.getField("ref").getValue();
              var art = _form.getField("bild_art").getValue();
              var id = _form.getField("id").getValue();

              formdata.append('datei', f);  // Anhängen der Datei an das Objekt
              formdata.append('ref', typ);  // Anhängen der Datei an das Objekt
              formdata.append('bild_art', art);  // Anhängen der Datei an das Objekt
              formdata.append('id', id);  // Anhängen der Datei an das Objekt

              xhr.upload.addEventListener("progress", progressHandler(_status), false); // ist für den Übertragungsprozess verantwortlich u.a. für die Progressbar
              xhr.addEventListener("load", completeHandler(files.length), false); // Gibt die Antwort des Servers wieder bei abgeschlossener Übertragung
              xhr.addEventListener("error", errorHandler(_status), false); //Zeigt die Fehler-Texte an z.B. bei Fehlern im PHP Skript
              xhr.send(formdata);    // Absenden des Requests
          }
          //isc.say('<ul>' + output.join('') + '</ul>');

          document.getElementById(_list).innerHTML = '<ol>' + output.join('') + '</ol>'; //Namen der hochgel. Dateien werden angezeigt

          // Neu laden der Tabelle
      };
  }

  function progressHandler(_status){
//    document.getElementById('loaded_n_total').innerHTML = "Uploaded " + event.loaded + " bytes of " + event.total;
      return function(event){//callback
          var percent = (event.loaded / event.total) * 100;
          //   document.getElementById('progressBar').value = Math.round(percent); // Funktioniert wird aber nicht gebraucht
          document.getElementById(_status).innerHTML = Math.round(percent) + "% geladen";
      };
  }

  function completeHandler(i){
      return function(event){//callback
          var response = event.target.response;
          if(response == "ok"){
              if(i > 1){
                  isc.say(i + " Bilder erfolgreich hochgeladen");
              } else if(i == 1){
                  isc.say(i + " Bild erfolgreich hochgeladen");
              }
          } else{
              isc.say("Es konnten leider keine Bilder hochgeladen werden.<br />" + response);
          }
      };
      //  document.getElementById('progressBar').value = 0; // Funktioniert wird aber nicht gebraucht
  }
  function errorHandler(_status){
      return function(){//callback
          document.getElementById(_status).innerHTML = "Upload failed";
      };
  }



  /*
   * ******************** onRefresh-Function *********************
   * -------------------------------------------------------------
   */

  var onRefresh = function(_listgrid){
//    var jetzt = new Date();
      var dataSource = Canvas.getById(_listgrid).getDataSource();
      var request = {
          startRow: 0,
          endRow: (Canvas.getById(_listgrid).getVisibleRows()[1] + Canvas.getById(_listgrid).data.resultSize),
          sortBy: Canvas.getById(_listgrid).getSort(),
          showPrompt: false,
          params: {count: new Date()}
      };
      var callback = function(dsResponse, data, dsRequest){
          var resultSet = isc.ResultSet.create({
              dataSource: Canvas.getById(_listgrid).getDataSource(),
              initialLength: dsResponse.totalRows,
              initialData: dsResponse.data,
              sortSpecifiers: Canvas.getById(_listgrid).getSort()
          });
          Canvas.getById(_listgrid).setData(resultSet);
      };
      dataSource.fetchData(Canvas.getById(_listgrid).getCriteria(), callback, request);
  };
  var onRefreshStadion = function(_listgrid, _param1){
//    var jetzt = new Date();
      var dataSource = Canvas.getById(_listgrid).getDataSource();
      var request = {
          startRow: 0,
          endRow: (Canvas.getById(_listgrid).getVisibleRows()[1] + Canvas.getById(_listgrid).data.resultSize),
          sortBy: Canvas.getById(_listgrid).getSort(),
          showPrompt: false,
          params: {stadion_id: _param1,
              count: new Date()}
      };
      var callback = function(dsResponse, data, dsRequest){
          var resultSet = isc.ResultSet.create({
              dataSource: Canvas.getById(_listgrid).getDataSource(),
              initialLength: dsResponse.totalRows,
              initialData: dsResponse.data,
              sortSpecifiers: Canvas.getById(_listgrid).getSort()
          });
          Canvas.getById(_listgrid).setData(resultSet);
      };
      dataSource.fetchData(Canvas.getById(_listgrid).getCriteria(), callback, request);
  };
  var onRefreshStadionVereinsListe = function(_listgrid, _param1, _param2){
//    var jetzt = new Date();
      var dataSource = Canvas.getById(_listgrid).getDataSource();
      var request = {
          startRow: 0,
          endRow: (Canvas.getById(_listgrid).getVisibleRows()[1] + Canvas.getById(_listgrid).data.resultSize),
          sortBy: Canvas.getById(_listgrid).getSort(),
          showPrompt: false,
          params: {stadion_id: _param1,
              land: _param2,
              count: new Date()}
      };
      var callback = function(dsResponse, data, dsRequest){
          var resultSet = isc.ResultSet.create({
              dataSource: Canvas.getById(_listgrid).getDataSource(),
              initialLength: dsResponse.totalRows,
              initialData: dsResponse.data,
              sortSpecifiers: Canvas.getById(_listgrid).getSort()
          });
          Canvas.getById(_listgrid).setData(resultSet);
      };
      dataSource.fetchData(Canvas.getById(_listgrid).getCriteria(), callback, request);
  };
  var onRefreshVerein = function(_listgrid, _param1){
//    var jetzt = new Date();
      var dataSource = Canvas.getById(_listgrid).getDataSource();
      var request = {
          startRow: 0,
          endRow: (Canvas.getById(_listgrid).getVisibleRows()[1] + Canvas.getById(_listgrid).data.resultSize),
          sortBy: Canvas.getById(_listgrid).getSort(),
          showPrompt: false,
          params: {verein_id: _param1,
              count: new Date()}
      };
      var callback = function(dsResponse, data, dsRequest){
          var resultSet = isc.ResultSet.create({
              dataSource: Canvas.getById(_listgrid).getDataSource(),
              initialLength: dsResponse.totalRows,
              initialData: dsResponse.data,
              sortSpecifiers: Canvas.getById(_listgrid).getSort()
          });
          Canvas.getById(_listgrid).setData(resultSet);
      };
      dataSource.fetchData(Canvas.getById(_listgrid).getCriteria(), callback, request);
  };
  var onRefreshVereinStadionListe = function(_listgrid, _param1, _param2){
//    var jetzt = new Date();
      var dataSource = Canvas.getById(_listgrid).getDataSource();
      var request = {
          startRow: 0,
          endRow: (Canvas.getById(_listgrid).getVisibleRows()[1] + Canvas.getById(_listgrid).data.resultSize),
          sortBy: Canvas.getById(_listgrid).getSort(),
          showPrompt: false,
          params: {verein_id: _param1,
              land: _param2,
              count: new Date()}
      };
      var callback = function(dsResponse, data, dsRequest){
          var resultSet = isc.ResultSet.create({
              dataSource: Canvas.getById(_listgrid).getDataSource(),
              initialLength: dsResponse.totalRows,
              initialData: dsResponse.data,
              sortSpecifiers: Canvas.getById(_listgrid).getSort()
          });
          Canvas.getById(_listgrid).setData(resultSet);
      };
      dataSource.fetchData(Canvas.getById(_listgrid).getCriteria(), callback, request);
  };
  var onRefreshSpielerExVereinListe = function(_listgrid, _param1, _param2){
//    var jetzt = new Date();
      var dataSource = Canvas.getById(_listgrid).getDataSource();
      var request = {
          startRow: 0,
          endRow: (Canvas.getById(_listgrid).getVisibleRows()[1] + Canvas.getById(_listgrid).data.resultSize),
          sortBy: Canvas.getById(_listgrid).getSort(),
          showPrompt: false,
          params: {spieler_id: _param1, count: _param2}
      };
      var callback = function(dsResponse, data, dsRequest){
          var resultSet = isc.ResultSet.create({
              dataSource: Canvas.getById(_listgrid).getDataSource(),
              initialLength: dsResponse.totalRows,
              initialData: dsResponse.data,
              sortSpecifiers: Canvas.getById(_listgrid).getSort()
          });
          Canvas.getById(_listgrid).setData(resultSet);
      };
      dataSource.fetchData(Canvas.getById(_listgrid).getCriteria(), callback, request);
  };
  var onRefreshStadionAdd = function(_listgrid, _param1){
//    var jetzt = new Date();
      var dataSource = Canvas.getById(_listgrid).getDataSource();
      var request = {
          startRow: 0,
          endRow: (Canvas.getById(_listgrid).getVisibleRows()[1] + Canvas.getById(_listgrid).data.resultSize),
          sortBy: Canvas.getById(_listgrid).getSort(),
          showPrompt: false,
          params: {land: _param1,
              count: new Date()}
      };
      var callback = function(dsResponse, data, dsRequest){
          var resultSet = isc.ResultSet.create({
              dataSource: Canvas.getById(_listgrid).getDataSource(),
              initialLength: dsResponse.totalRows,
              initialData: dsResponse.data,
              sortSpecifiers: Canvas.getById(_listgrid).getSort()
          });
          Canvas.getById(_listgrid).setData(resultSet);
      };
      dataSource.fetchData(Canvas.getById(_listgrid).getCriteria(), callback, request);
  };
  var onRefreshStadionEdit = function(_listgrid, _param1, _param2){
//    var jetzt = new Date();
      var dataSource = Canvas.getById(_listgrid).getDataSource();
      var request = {
          startRow: 0,
          endRow: (Canvas.getById(_listgrid).getVisibleRows()[1] + Canvas.getById(_listgrid).data.resultSize),
          sortBy: Canvas.getById(_listgrid).getSort(),
          showPrompt: false,
          params: {land: _param1,
              stadEditCount: _param2,
              count: new Date()}
      };
      var callback = function(dsResponse, data, dsRequest){
          var resultSet = isc.ResultSet.create({
              dataSource: Canvas.getById(_listgrid).getDataSource(),
              initialLength: dsResponse.totalRows,
              initialData: dsResponse.data,
              sortSpecifiers: Canvas.getById(_listgrid).getSort()
          });
          Canvas.getById(_listgrid).setData(resultSet);
      };
      dataSource.fetchData(Canvas.getById(_listgrid).getCriteria(), callback, request);
  };
  var onRefreshSpielerEdit = function(_listgrid, _param1, _param2){
//    var jetzt = new Date();
      var dataSource = Canvas.getById(_listgrid).getDataSource();
      var request = {
          startRow: 0,
          endRow: (Canvas.getById(_listgrid).getVisibleRows()[1] + Canvas.getById(_listgrid).data.resultSize),
          sortBy: Canvas.getById(_listgrid).getSort(),
          showPrompt: false,
          params: {land: _param1,
              spEditCount: _param2,
              count: new Date()}
      };
      var callback = function(dsResponse, data, dsRequest){
          var resultSet = isc.ResultSet.create({
              dataSource: Canvas.getById(_listgrid).getDataSource(),
              initialLength: dsResponse.totalRows,
              initialData: dsResponse.data,
              sortSpecifiers: Canvas.getById(_listgrid).getSort()
          });
          Canvas.getById(_listgrid).setData(resultSet);
      };
      dataSource.fetchData(Canvas.getById(_listgrid).getCriteria(), callback, request);
  };
  var onRefreshSpieler = function(_listgrid, _param1, _param2){
//    var jetzt = new Date();
      var dataSource = Canvas.getById(_listgrid).getDataSource();
      var request = {
          startRow: 0,
          endRow: (Canvas.getById(_listgrid).getVisibleRows()[1] + Canvas.getById(_listgrid).data.resultSize),
          sortBy: Canvas.getById(_listgrid).getSort(),
          showPrompt: false,
          params: {spieler_id: _param1, count: _param2}
      };
      var callback = function(dsResponse, data, dsRequest){
          var resultSet = isc.ResultSet.create({
              dataSource: Canvas.getById(_listgrid).getDataSource(),
              initialLength: dsResponse.totalRows,
              initialData: dsResponse.data,
              sortSpecifiers: Canvas.getById(_listgrid).getSort()
          });
          Canvas.getById(_listgrid).setData(resultSet);
      };
      dataSource.fetchData(Canvas.getById(_listgrid).getCriteria(), callback, request);
  };
  /*
   * 
   * @param {type} zahl
   * @param {type} n
   * @returns {@exp;Math@call;round|@exp;@exp;Math@call;roundfaktor}
   */

  var rundung = function myRound(zahl, n){
      var faktor;
      faktor = Math.pow(10, n);
      return(Math.round(zahl * faktor) / faktor);
  };
  var countryMap = function(){
      RPCManager.send("", function(rpcResponse, data, rpcRequest){
          var _data = isc.JSON.decode(data);
          if(_data.response.status === 0){
              var code = _data.response.data["code"];
              var nine = _data.response.data["nine"];
              urlCountryMap = '<img src="http://chart.apis.google.com/chart?cht=map:fixed=-60,-180,80,180&chs=680x400&chf=bg,s,336699&chco=d0d0d0,cc0000&chd=s:' + nine + '&chld=' + code + '" width="680" height="400" >';
//                alert(urlCountryMap);
              paneCountryMap.setContents(urlCountryMap);
          }
      }, {// Übergabe der Parameter
          actionURL: "api/ds/laenderMapDS.php",
          httpMethod: "POST",
          contentType: "application/x-www-form-urlencoded",
          useSimpleHttp: true
      }); //Ende RPC
  };

  onRefreshSpieleSpielerQuellListe = function(_listgrid, _param1){
//    var jetzt = new Date();
      var dataSource = Canvas.getById(_listgrid).getDataSource();
      var request = {
          startRow: 0,
          endRow: (Canvas.getById(_listgrid).getVisibleRows()[1] + Canvas.getById(_listgrid).data.resultSize),
          sortBy: Canvas.getById(_listgrid).getSort(),
          showPrompt: false,
          params: {spiel_id: _param1,
              countQuelle: new Date()}
      };
      var callback = function(dsResponse, data, dsRequest){
          var resultSet = isc.ResultSet.create({
              dataSource: Canvas.getById(_listgrid).getDataSource(),
              initialLength: dsResponse.totalRows,
              initialData: dsResponse.data,
              sortSpecifiers: Canvas.getById(_listgrid).getSort()
          });
          Canvas.getById(_listgrid).setData(resultSet);
      };
      dataSource.fetchData(Canvas.getById(_listgrid).getCriteria(), callback, request);
  };
  onRefreshSpieleSpielerQuellListe2 = function(_listgrid, _param1, _param2, _param3){
//    var jetzt = new Date();
      var dataSource = Canvas.getById(_listgrid).getDataSource();
      var request = {
          startRow: 0,
          endRow: (Canvas.getById(_listgrid).getVisibleRows()[1] + Canvas.getById(_listgrid).data.resultSize),
          sortBy: Canvas.getById(_listgrid).getSort(),
          showPrompt: false,
          params: {spiel_id: _param1,
              countQuelle2: new Date(),
              status: _param2,
              status2: _param3}
      };
      var callback = function(dsResponse, data, dsRequest){
          var resultSet = isc.ResultSet.create({
              dataSource: Canvas.getById(_listgrid).getDataSource(),
              initialLength: dsResponse.totalRows,
              initialData: dsResponse.data,
              sortSpecifiers: Canvas.getById(_listgrid).getSort()
          });
          Canvas.getById(_listgrid).setData(resultSet);
      };
      dataSource.fetchData(Canvas.getById(_listgrid).getCriteria(), callback, request);
  };







 
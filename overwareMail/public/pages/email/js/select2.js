/* select2 js */
// 보내는사람
$(".sender-select").select2({
  ajax: {
    url: "/email/searchAll",
    dataType: 'json',
    delay: 250,
    data: function (params) {
      return {
        search: params.term, // search term
        page: params.page
      };
    },
    processResults: function (data, params) {
      if(data.status){
        params.page = params.page || 1;
        return {
          results: data.result.items,
          pagination: {
            more: (params.page * 10) < data.result.total_count
          }
        };
      }
      $('#login-Modal').modal('show');
      return { results: [],pagination: {
          more: false
        }
      };
    },
    cache: true
  },
  multiple: false,
  placeholder: '보내는 사람',
  language: 'ko',
  allowClear: true,
  escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
  minimumInputLength: 0,
  templateResult: function (repo) {
    if (repo.loading) {
      return repo.text;
    }
    var markup = repo['M_name']+" &lt;"+repo['M_email']+"&gt;";
    return markup;
  },
  templateSelection: function (repo) {
    if(typeof repo['M_name'] == 'undefined'){
      return repo.text;
    }
    return repo['M_name']+" &lt;"+repo['M_email']+"&gt;";
  }
});
// 받는사람
$(".recipi-select").select2({
  ajax: {
    url: "/email/searchAll",
    dataType: 'json',
    delay: 250,
    data: function (params) {
      return {
        search: params.term, // search term
        page: params.page
      };
    },
    processResults: function (data, params) {
      if(data.status){
        params.page = params.page || 1;
        return {
          results: data.result.items,
          pagination: {
            more: (params.page * 10) < data.result.total_count
          }
        };
      }
      $('#login-Modal').modal('show');
      return {
        results: [],
        pagination: {
          more: false
        }
      };
    },
    cache: true
  },
  multiple: true,
  placeholder: '받는 사람',
  allowClear: true,
  language: 'ko',
  minimumInputLength: 0,
  escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
  templateResult: function (repo) {
    if (repo.loading) {
      return repo.text;
    }
    var markup = repo['M_name']+" &lt;"+repo['M_email']+"&gt;";
    return markup.replace('\n','');
  },
  templateSelection: function (repo) {
    if(typeof repo['M_name'] == 'undefined'){
      return repo.text;
    }
    var result = repo['M_name']+" &lt;"+repo['M_email']+"&gt;";
    return result.replace('\n','');
  }
});
$('.recipi-select').on('select2:opening select2:closing', function( event ) {
  var $searchfield = $(this).parent().find('.select2-search__field');
  $searchfield.prop('disabled', true);
});
// 수신자 그룹
$(".group-select").select2({
  ajax: {
    url: "/email/searchGroup",
    dataType: 'json',
    delay: 250,
    data: function (params) {
      return {
        search: params.term, // search term
        page: params.page
      };
    },
    processResults: function (data, params) {
      if(data.status){
        params.page = params.page || 1;
        return {
          results: data.result.items,
          pagination: {
            more: (params.page * 10) < data.result.total_count
          }
        };
      }
      $('#login-Modal').modal('show');
      return {
        results: [],
        pagination: {
          more: false
        }
      };
    },
    cache: true
  },
  multiple: true,
  placeholder: '수신자 그룹',
  allowClear: true,
  language: 'ko',
  minimumInputLength: 0,
  escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
  templateResult: function (repo) {
    if (repo.loading) {
      return repo.text;
    }
    var markup = repo['M_group_title']+" &lt; "+repo['groupCount']+"명 &gt;";
    return markup;
  },
  templateSelection: function (repo) {
    if(typeof repo['M_group_title'] == 'undefined'){
      return repo.text;
    }
    return repo['M_group_title']+" &lt; "+repo['groupCount']+"명 &gt;";
  }
});
$('.group-select').on('select2:opening select2:closing', function( event ) {
  var $searchfield = $(this).parent().find('.select2-search__field');
  $searchfield.prop('disabled', true);
});

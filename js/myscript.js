
$(function() {
    //show modal
    $('#thongbao').modal('show')
    //Loading button
    $('#btnSave').on('click', function() {
        var $btn = $(this).button('loading')
        // business logic...
        $btn.button('reset')
    })
    //binding modal
    $('#myModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var title = button.data('title')
        var pid = button.data('pid')
        var pname = button.data('pname')
        var pdes = button.data('pdes')
        var pmnf = button.data('pmnf')
        var pmadein = button.data('pmadein')
        var pdc = button.data('pdc')
        var psta = button.data('psta')
        var pstart = button.data('pstart')
        var pend = button.data('pend')
        var pprice = button.data('pprice')
        var modal = $(this)
        modal.find('.modal-title').text(title)
        modal.find('#id').val(pid)
        modal.find('#name').val(pname)
        modal.find('#des').val(pdes)
        modal.find('#mnf').val(pmnf)
        modal.find('#madein').val(pmadein)
        if (pdc == 'Yes')
            modal.find('#discount').prop("checked", true);
        if (pdc == 'No')
            modal.find('#discount').prop("checked", false);
        modal.find('#status').val(psta)
        modal.find('#start').val(pstart)
        modal.find('#end').val(pend)
        modal.find('#price').val(pprice)
        $("#id").prop("readonly",true);
        if (title == 'Customer Detail') {
            $('#btnSave').addClass('hidden');
            $("#name").prop("readonly",true);
            $("#des").prop("readonly",true);
            $("#mnf").prop("readonly",true);
            $("#madein").prop("readonly",true);
            $("#discount").prop("readonly",true);
            $("#status").prop("readonly",true);
            $("#start").prop("readonly",true);
            $("#end").prop("readonly",true);
            $("#price").prop("readonly",true);
        }
        if (title == 'Update Customer'){
            $('#btnSave').removeClass('hidden');        
            $("#name").prop("readonly",false);
            $("#des").prop("readonly",false);
            $("#mnf").prop("readonly",false);
            $("#madein").prop("readonly",false);
            $("#discount").prop("readonly",false);
            $("#status").prop("readonly",false);
            $("#start").prop("readonly",false);
            $("#end").prop("readonly",false);
            $("#price").prop("readonly",false);
        }
            
    });
    //auto active
    $("#home a:contains('Home')").parent().addClass('active');
    $("#search a:contains('Product')").parent().addClass('active');
    $("#add a:contains('Add')").parent().addClass('active');
    $("#user a:contains('User')").parent().addClass('active');
    $("#about a:contains('About')").parent().addClass('active');

});


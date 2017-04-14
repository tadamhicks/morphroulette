<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Balls"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>



    <g:layoutBody/>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

    <g:javascript>
$(function() {

    var msa = [
        <g:each in="${entereds}" var="entered" status="i">
        { name: "${entered.lastName}, ${entered.firstName}" },
        </g:each>
    ],
        $input = $('input'),
        random_index;

    //make list for slots recursively and call spin when complete
    function makeSlotList(list){
        //could choose one random index and then populate with next 18 values instead, but need to account for looping at end
        if(list.length<20){//length chosen based on appearance of spin, can be changed
            var index = _.random(msa.length-1);
            if(list.length===1){
                /*
                    This index will be second item in the list, which is our winning number
                    Save this for future reference
                    Instead of saving it, we could get the index attribute from the list item we end on
                */
                random_index = index;
            }
            list.push( '<li index='+_.random(msa.length-1)+'>'+msa[index].name+'</li>' );
            return makeSlotList(list);
        } else {
            //slot list is complete
            //clear search field
            $input.val('');
            //attach list, show jslots, run animation
            $('#slot').html(list.join('')).parent().show().trigger('spin');
            return list;
        }
    }

    //before spinning, build out list to spin through and insert into the DOM
    function makeSlots(){
        //start with current value
        var list = ['<li>'+$input.val()+'</li>'];

        //call recursive list builder that won't spin slots until it's finished
        makeSlotList(list);
    }

    $('#slot').jSlots({
        number: 1,
        spinner : '.jSlots-wrapper',
        spinEvent: 'spin',
        time: 300,
        loops: 1,
        endNum: 2,//spins backwards through the list. endNum 1 ends on the same value we started on
        onEnd: function(finalElement){
            //set result
            $input.val(msa[random_index].name);
            //hide spinner
            $(this.spinner).hide();
        }
    });

    //bind random button
    $('#random_location').on('click', makeSlots);
});
</g:javascript>

</body>
</html>

<%@ page import="com.gzfs.entity.Movie" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Time" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>在线选座</title>
    <meta name="keywords" content="jQuery在线选座,jQuery选座系统" />
    <meta name="description" content="jquery.seat-charts是一款适合电影票、高铁票的在线选座插件。" />
    <link rel="stylesheet" type="text/css" href="css/jq22.css" />
    <%
        Movie movie= (Movie) session.getAttribute("MovieInformation");
    %>
    <style type="text/css">

        .front{width: 300px;margin: 5px 32px 45px 32px;background-color: #f0f0f0;	color: #666;text-align: center;padding: 3px;border-radius: 5px;}

        .booking_area {float: right;position: relative;width:200px;height: 450px; }

        .booking_area h3 {margin: 5px 5px 0 0;font-size: 16px;}

        .booking_area p{line-height:26px; font-size:16px; color:#999}

        .booking_area p span{color:#666}

        div.seatCharts-cell {color: #182C4E;height: 25px;width: 25px;line-height: 25px;margin: 3px;float: left;text-align: center;outline: none;font-size: 13px;}

        div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}

        div.seatCharts-row {height: 35px;}

        div.seatCharts-seat.available {background-color: #B9DEA0;}

        div.seatCharts-seat.focused {background-color: #76B474;border: none;}

        div.seatCharts-seat.selected {background-color: #E6CAC4;}

        div.seatCharts-seat.unavailable {background-color: #472B34;cursor: not-allowed;}

        div.seatCharts-container {border-right: 1px dotted #adadad;width: 400px;padding: 20px;float: left;}

        div.seatCharts-legend {padding-left: 0px;position: absolute;bottom: 16px;}

        ul.seatCharts-legendList {padding-left: 0px;}

        .seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}

        span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}

        .checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}

        #seats_chose {max-height: 150px;overflow-y: auto;overflow-x: none;width: 200px;}

        #seats_chose li{float:left; width:72px; height:26px; line-height:26px; border:1px solid #d3d3d3; background:#f7f7f7; margin:6px; font-size:14px; font-weight:bold; text-align:center}

    </style>

</head>

<body>

<div class="container">

    <h2 class="title"><a>在线选座</a></h2>

    <div class="demo clearfix">

        <!---左边座位列表----->

        <div id="seat_area">

            <div class="front">屏幕</div>

        </div>

        <!---右边选座信息----->

        <div class="booking_area">

            <p>电影：<span><%=movie.getName()%></span></p>

            <p>座位：</p>

            <ul id="seats_chose"></ul>

            <p>票数：<span id="tickects_num">0</span></p>

            <p>总价：<b>￥<span id="total_price">0</span></b></p>

            <form method="post" action="buymovie">
                <input type="hidden" value="">
                <input type="submit" class="btn"  value="确定购买"/>
            </form>
            <div id="legend"></div>

        </div>

    </div>

</div>
<%
    request.setCharacterEncoding("UTF-8");
    String Buy_msg=request.getParameter("Buy_msg");
    System.out.println(Buy_msg);
%>
<script>
    var msg=<%=Buy_msg%>;
    if(msg==="failure"){
        alert("购买失败！");
    }
</script>
<script src="http://www.jq22.com/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.seat-charts.min.js"></script>
<script type="text/javascript">

    var price = <%=movie.getPrice()%>; //电影票价

    $(document).ready(function() {

        var $cart = $('#seats_chose'), //座位区

            $tickects_num = $('#tickects_num'), //票数

            $total_price = $('#total_price'); //票价总额

        var sc = $('#seat_area').seatCharts({

            map: [//座位结构图 a 代表座位; 下划线 "_" 代表过道

                'cccccccccc',

                'cccccccccc',

                '__________',

                'cccccccc__',

                'cccccccccc',

                'cccccccccc',

                'cccccccccc',

                'cccccccccc',

                'cccccccccc',

                'cc__cc__cc'

            ],

            naming: {//设置行列等信息

                top: false, //不显示顶部横坐标（行）

                getLabel: function(character, row, column) { //返回座位信息

                    return column;

                }

            },

            legend: {//定义图例

                node: $('#legend'),

                items: [

                    ['c', 'available', '可选座'],

                    ['c', 'unavailable', '已售出']

                ]

            },

            click: function() {

                if (this.status() == 'available') { //若为可选座状态，添加座位

                    $('<li>' + (this.settings.row + 1) + '排' + this.settings.label + '座</li>')

                        .attr('id', 'cart-item-' + this.settings.id)

                        .data('seatId', this.settings.id)

                        .appendTo($cart);



                    $tickects_num.text(sc.find('selected').length + 1); //统计选票数量

                    $total_price.text(getTotalPrice(sc) + price);//计算票价总金额



                    return 'selected';

                } else if (this.status() == 'selected') { //若为选中状态

                    $tickects_num.text(sc.find('selected').length - 1);//更新票数量

                    $total_price.text(getTotalPrice(sc) - price);//更新票价总金额

                    $('#cart-item-' + this.settings.id).remove();//删除已预订座位
                    return 'available';

                } else if (this.status() == 'unavailable') { //若为已售出状态

                    return 'unavailable';

                } else {

                    return this.style();

                }

            }

        });

        //设置已售出的座位

        sc.get(['1_3', '1_4', '4_4', '4_5', '4_6', '4_7', '4_8']).status('unavailable');



    });
    function getTotalPrice(sc) { //计算票价总额
        var total = 0;
        sc.find('selected').each(function() {
            total += price;
        });

        return total;

    }
</script>
</body>
</html>



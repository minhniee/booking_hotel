
<div class="col-md-5">
    <div class="booking-box">
        <div class="head-box">
            <h4>Hotel Booking Form</h4>
        </div>
        <div class="booking-inner clearfix">
            <form action="${url}/BookingHandle" method="get" class="form1 clearfix">
                <div class="row">
                    <div class="col-md-12">
                        <div class="input1_wrapper">
                            <label id=>Check in</label>
                            <div class="input1_inner">
                                <input type="text" class="form-control input datepicker" id="from" value="${checkInDate}" name="checkInDate" placeholder="Check in" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="input1_wrapper">
                            <label id=>Check out </label>
                            <div class="input1_inner">
                                <input type="text" class="form-control input datepicker" id="to" value="${checkOutDate}" name="checkOutDate" placeholder="Check out" required>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="select1_wrapper">
                            <label>Adults</label>
                            <div class="select1_inner">
                                <select class="select2 select" name="adults" style="width: 100%">
                                    <option value="0">Adults</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="select1_wrapper">
                            <label>Children</label>
                            <div class="select1_inner">
                                <select class="select2 select" name="children" style="width: 100%">
                                    <option value="0">Children</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <span style="color: red">${noti}</span>
                    <span style="color: red">${currentDate}</span>
                    <div class="col-md-12">
                        <button type="submit" class="btn-form1-submit mt-15">Check Availability</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


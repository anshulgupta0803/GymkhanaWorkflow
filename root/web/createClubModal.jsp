<%
    Integer type = (Integer)session.getAttribute("type");
    if (type != null && type == 1)
    {
%>
    <div class="ui modal createClub">
            <i class="close icon"></i>
            <div class="header">
                  Create Club
            </div>
            <div class="content">
                <div>
                    <form action="createaction.jsp?id=club" method = "post">
                        <center>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" name="clubname" placeholder = "Club Name" size=48 required/></div>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" name="coordinator" placeholder = "Club Coordinator" size=48 required/></div>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" name="faculty" placeholder = "Faculty Mentor" size=48 required/></div>
                            <div style="width:310px; height:40px; "><select style="width:310px;" name="council">
                                <option>Gymkhana Council</option>
                                <option value="ScTech">Science & Technology</option>
                                <option value="Cult">Cultural</option>
                                <option value="Sports">Sports</option> 
                                </select> 
                            </div>
                            <div style="width:310px; height:40px; "><input id = "datetimepicker_2" style="width:309px;" type="datetime" step="0.01" name="club_date_activation" title = "Start Date" required/></div>
                            <div style="width:310px; height:40px; "><input id = "datetimepicker_1" style="width:309px;" type="datetime" step="0.01" name="club_date_valid_upto" title = "End Date" required/></div>
                            <div style="width:310px; height:40px; "><input style="width:309px;" type="number" step="0.01" name="amount" placeholder = "Budget Allocated" required/></div>
                            <div style="width:310px; height:40px; "><textarea style="width:309px; height:80px;" name="about" placeholder="About the Club"></textarea></div>
                            <br/><br/><br/><br/>
                            <div style="width:310px; height:40px; "><input type="submit" value="Create Club"  /></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>
<%
    }
%>
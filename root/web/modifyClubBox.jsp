<div class="ui modal modifyClub">
            <i class="close icon"></i>
            <div class="header">
                 Modify Club
            </div>
            <div class="content">
                <div>
                    <form>
                        <center>
                            <select name="modifyClubId">
                                <%
                                    SQL = "SELECT `club_id`, `club_name` FROM `club`";
                                    try
                                    {
                                        db.pstmt = db.conn.prepareStatement(SQL);
                                        try
                                        {
                                            db.rs = db.pstmt.executeQuery();
                                            while (db.rs.next())
                                                out.print ("<option value=" + db.rs.getInt("club_id") + ">" + db.rs.getString("club_name") + "</option>");
                                        }
                                        catch (SQLException e){}
                                    }
                                    catch (SQLException e){}
                                    finally
                                    {
                                        //db.conn.close();
                                    }
                                %>
                            </select>
                            <div style="width:310px; height:40px; "><input type="submit" value="Modify Club"></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>
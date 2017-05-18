using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

public partial class EventCalendar : System.Web.UI.Page
{
   // private static string webconfigrationManger;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public class Event
    {
        public string ID { get; set; }
        public string EventTitle { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string note { get; set; }
        public string type { get; set; }
        public string repeat { get; set; }
    };
    [WebMethod]
    public static List<Event> GetEvents()
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "SELECT * FROM NAJAAH_EVENTS";

        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        List<Event> events = new List<Event>();

        if (reader.HasRows)
        {
            var indexOfID = reader.GetOrdinal("ID");
            var indexOfTitle = reader.GetOrdinal("TITLE");
            var indexOfStartDate = reader.GetOrdinal("EVENT_START");
            var indexOfEndDate = reader.GetOrdinal("EVENT_END");
            var indexOfNote = reader.GetOrdinal("NOTE");
            var indexOfType = reader.GetOrdinal("EVENT_TYPE");
            var indexOfRepeat = reader.GetOrdinal("REPEAT");

            while (reader.Read())
            {

                var id = reader.GetValue(indexOfID).ToString();
                var Title = reader.GetValue(indexOfTitle).ToString();
                var DateStart = reader.GetValue(indexOfStartDate).ToString();
                var DateEnd = reader.GetValue(indexOfEndDate).ToString();
                var NOTE = reader.GetValue(indexOfNote).ToString();
                var TYPE = reader.GetValue(indexOfType).ToString();
                var REPEAT = reader.GetValue(indexOfRepeat).ToString();

                events.Add(new Event()
                {
                    ID = id,
                    EventTitle = Title,
                    StartDate = DateStart,
                    EndDate = DateEnd,
                    note = NOTE,
                    type = TYPE,
                    repeat = REPEAT 

                });


            }


            myConnection.Close();
        }

        return events;

    }

    [WebMethod]
    public static bool SaveEvents(Event e)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);
        myConnection.Open();
        String query = "INSERT INTO dbo.NAJAAH_EVENTS (TITLE, EVENT_START, EVENT_END, NOTE)VALUES (@title, @start, @end, @note)";
        SqlCommand command = new SqlCommand(query, myConnection);
        command.Parameters.AddWithValue("@title", e.EventTitle);
        command.Parameters.AddWithValue("@start", e.StartDate);
        command.Parameters.AddWithValue("@end", e.EndDate);
        if (String.IsNullOrEmpty(e.note))
        {
            command.Parameters.AddWithValue("@note", DBNull.Value);
        }
        else
        {
            command.Parameters.AddWithValue("@note", e.note);
        }
        command.Parameters.AddWithValue("@type", e.type);
        command.Parameters.AddWithValue("@repeat", e.repeat);
        command.ExecuteNonQuery();
        myConnection.Close();
        return true;
    }

    [WebMethod]
    public static bool DeleteEvents(Event e)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);
        myConnection.Open();
        String query = "DELETE FROM dbo.NAJAAH_EVENTS WHERE ID = '"+e.ID+"'";
        SqlCommand command = new SqlCommand(query, myConnection);
        command.ExecuteNonQuery();
        myConnection.Close();
        return true;
    }

    [WebMethod]
    public static bool UpdateEvents(Event e)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);
        myConnection.Open();
        String query = "UPDATE dbo.NAJAAH_EVENTS SET TITLE = '"+e.EventTitle+"', EVENT_START = '"+e.StartDate+"', EVENT_END = '"+e.EndDate+"', NOTE = '"+e.note+"', EVENT_TYPE = '"+e.type+"', REPEAT = '"+e.repeat+"' WHERE ID = '" + e.ID + "'";
        SqlCommand command = new SqlCommand(query, myConnection);
        command.ExecuteNonQuery();
        myConnection.Close();
        return true;
    }

    [WebMethod]
    public static Event ShowEvent(Event e)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "SELECT * FROM NAJAAH_EVENTS WHERE ID = '"+e.ID+"'";

        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();
        Event eventData = null;
        if (reader.HasRows)
        {
            var indexOfID = reader.GetOrdinal("ID");
            var indexOfTitle = reader.GetOrdinal("TITLE");
            var indexOfStartDate = reader.GetOrdinal("EVENT_START");
            var indexOfEndDate = reader.GetOrdinal("EVENT_END");
            var indexOfNote = reader.GetOrdinal("NOTE");
            var indexOfType = reader.GetOrdinal("EVENT_TYPE");
            var indexOfRepeat = reader.GetOrdinal("REPEAT");

            while (reader.Read())
            {

                var id = reader.GetValue(indexOfID).ToString();
                var Title = reader.GetValue(indexOfTitle).ToString();
                var DateStart = reader.GetValue(indexOfStartDate).ToString();
                var DateEnd = reader.GetValue(indexOfEndDate).ToString();
                var NOTE = reader.GetValue(indexOfNote).ToString();
                var TYPE = reader.GetValue(indexOfType).ToString();
                var REPEAT = reader.GetValue(indexOfRepeat).ToString();

                
                eventData = new Event()
                {
                    ID = id,
                    EventTitle = Title,
                    StartDate = DateStart,
                    EndDate = DateEnd,
                    note = NOTE,
                    type = TYPE,
                    repeat = REPEAT

                };


            }


            myConnection.Close();
        }

        return eventData;
    }
}
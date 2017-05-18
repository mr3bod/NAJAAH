using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public class user
    {
        public string id { get; set; }
        public string name { get; set; }
        public string major { get; set; }
        public string advisor_ID { get; set; }
        public string advisor_Name { get; set; }
        public string GPA { get; set; }
        public string level { get; set; }
        public string standing { get; set; }
        public string clas { get; set; }
    };

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static user checkStudent(user e)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "SELECT STU_ID, STU_FIRST_NAME, STU_LAST_NAME, STU_LEVEL_DESC, STU_MAJOR, STU_CUMM_GPA, ADVISOR_ID, ADVISOR_NAME, STU_STANDING, STU_CLASS FROM VIEW_STUDENT WHERE STU_ID =  '" + e.id + "'";

        SqlCommand cmd = new SqlCommand(query, myConnection);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {

            var indexOfId = reader.GetOrdinal("STU_ID");
            var indexOffName = reader.GetOrdinal("STU_FIRST_NAME");
            var indexOflName = reader.GetOrdinal("STU_LAST_NAME");
            var indexOfLevel = reader.GetOrdinal("STU_LEVEL_DESC");
            var indexOfMajor = reader.GetOrdinal("STU_MAJOR");
            var indexOfGPA = reader.GetOrdinal("STU_CUMM_GPA");
            var indexOfAID = reader.GetOrdinal("ADVISOR_ID");
            var indexOfAName = reader.GetOrdinal("ADVISOR_NAME");
            var indexOfStanding = reader.GetOrdinal("STU_STANDING");
            var indexOfClass = reader.GetOrdinal("STU_CLASS");

            while (reader.Read())
            {

                e.id = reader.GetValue(indexOfId).ToString();
                e.name = reader.GetValue(indexOffName).ToString();
                e.name += " " + reader.GetValue(indexOflName).ToString();
                e.level = reader.GetValue(indexOfLevel).ToString();
                e.major = reader.GetValue(indexOfMajor).ToString();
                e.GPA = reader.GetValue(indexOfGPA).ToString();
                e.advisor_ID = reader.GetValue(indexOfAID).ToString();
                e.advisor_Name = reader.GetValue(indexOfAName).ToString();
                e.standing = reader.GetValue(indexOfStanding).ToString();
                e.clas = reader.GetValue(indexOfClass).ToString();

            }

        }

        Debug.WriteLine(e.id);
        Debug.WriteLine(e.name);
        Debug.WriteLine(e.major);
        Debug.WriteLine(e.GPA);
        Debug.WriteLine(e.advisor_ID);
        Debug.WriteLine(e.advisor_Name);
        if (e.major != "")
            return e;
        return checkFaculty(e);
    }

    [WebMethod]
    public static user checkFaculty(user e)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "SELECT FAC_ID, FAC_FIRST_NAME, FAC_LAST_NAME FROM VIEW_FACULTY WHERE FAC_ID = '" + e.id + "'";

        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {

            var indexOfId = reader.GetOrdinal("FAC_ID");
            var indexOffName = reader.GetOrdinal("FAC_FIRST_NAME");
            var indexOflName = reader.GetOrdinal("FAC_LAST_NAME");

            while (reader.Read())
            {

                e.id = reader.GetValue(indexOfId).ToString();
                e.name = reader.GetValue(indexOffName).ToString();
                e.name += " " + reader.GetValue(indexOflName).ToString();

            }

        }
     

        return e;

    }
}
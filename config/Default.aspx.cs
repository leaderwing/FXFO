using System;
using CORE.CoreObjectContext;

public partial class _Default : PageBase
{
    #region initiation page variables

    #endregion

    #region page init & load
    /// <summary>
    /// OnInit
    /// </summary>
    /// <param name="e"></param>
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        base.AuthorizeUserCtx();
        Response.CacheControl = "no-cache";
        Response.AddHeader("Pragma", "no-cache");
    }
    /// <summary>
    /// Page_Load
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    #endregion
}

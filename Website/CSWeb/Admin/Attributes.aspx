<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attributes.aspx.cs" Inherits="CSWeb.Admin.Attributes" MasterPageFile="AdminSite.master" EnableSessionState="True" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <br>
    <span class="header"><font color="blue">Attributes Manager</font> </span>
    <br />
    <br />
    
    <strong>Objects</strong><br />
    <asp:DataGrid ID="dgObjects" runat="server" AutoGenerateColumns="false" ShowHeader="true" CellPadding="4">
        <HeaderStyle Font-Bold="true" />        
        <Columns>
            <asp:TemplateColumn HeaderText="Name">
                <ItemTemplate>
                    <%#Eval("Name")%>
                </ItemTemplate>
            </asp:TemplateColumn>            
            <asp:TemplateColumn HeaderText="Values Table Name">
                <ItemTemplate>
                    <%#Eval("ValuesTableName")%>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Primary Key Column Name">
                <ItemTemplate>
                    <%#Eval("PrimaryKeyColName")%>
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
    </asp:DataGrid>

    <br /><br />

    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" />
    <asp:Label ID="lblMessage" runat="server" Font-Bold="true" />
    <table width="90%" border="1" cellspacing="1" cellpadding="2">
        <tr>
            <td class="title" colspan="5">
                <strong>Attributes</strong>
            </td>
        </tr>
        <tr class="header">
            <td align="left" width="20%" class="ibn-sectionheader">
                Name
            </td>
            <td align="left" width="40%" class="ibn-sectionheader">
                Description
            </td>
            <td align="center" width="10%" class="ibn-sectionheader">
                Value Type
            </td>
            <td align="center" width="20%" class="ibn-sectionheader">
                Object Associations
            </td>
            <td>                
            </td>
        </tr>
        <asp:DataList ID="dlAttributes" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" 
            OnItemCommand="dlItem_ItemCommand" OnDataBinding="dlItem_DataBinding" OnItemDataBound="dlItem_ItemDataBound">
            <AlternatingItemStyle BackColor="#EBEBEB" />
            <ItemTemplate>
                <tr>
                    <td class="body" align="left" width="20%">
                        <asp:Literal ID="litAttributeName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' />
                    </td>
                    <td class="body" align="left" width="40%">
                        <%# DataBinder.Eval(Container.DataItem, "Description")%>
                    </td>
                    <td class="body" align="left" width="10%">
                        <%# DataBinder.Eval(Container.DataItem, "ValueTypeName") %>
                    </td>
                    <td class="body" align="left" width="20%">
                        <asp:Literal ID="litAssociations" runat="server" />
                    </td>
                    <td align="center">
                        <asp:LinkButton ID="lbSave" runat="server" CausesValidation="False" CommandName="Edit">
                            <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/edit.gif" BorderWidth="0"
                                ToolTip='Edit' /></asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False" CommandName="Delete">
                            <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif" BorderWidth="0"
                                ToolTip='Delete' /></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td class="body" align="left" width="20%">
                        <asp:RequiredFieldValidator ID="valName" runat="server" Display="Dynamic" ErrorMessage="Attribute Name required"
                            ControlToValidate="txtAttributeName">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtAttributeName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' MaxLength="50" />
                    </td>
                    <td class="body" align="left" width="40%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Attribute Description required"
                            ControlToValidate="txtDescription">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtDescription" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' MaxLength="100" style="width: 200px;" />
                    </td>
                    <td class="body" align="left" width="10%">
                        <asp:DropDownList ID="ddlAttributeValueType" runat="server" />
                    </td>
                    <td class="body" align="left" width="20%">
                        <asp:Literal ID="litAssociations" runat="server" /> &nbsp;  
                        <asp:LinkButton ID="lbEditAttributeAssociation" runat="server" Text="Edit" OnCommand="lbEditAttributeAssociation_Command" 
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "AttributeId") + "," + DataBinder.Eval(Container.DataItem, "Name") %>' />
                    </td>
                    <td align="center">
                        <asp:LinkButton ID="lbSave" runat="server" CausesValidation="True" CommandName="Update">
                            <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/save.gif" BorderWidth="0"
                                ToolTip='Save' /></asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel">
                            <asp:Image ID="Image3" runat="server" ImageUrl="/Content/images/admin/cancel.gif" BorderWidth="0"
                                ToolTip='Cancel' /></asp:LinkButton>
                    </td>
                </tr>
            </EditItemTemplate>
            <FooterTemplate>
                
                <tr>
                    <td colspan="5">
                        <asp:Image AlternateText="Add New Attribute" ID="imgAddItem" runat="server" ImageUrl='/Content/images/admin/add.gif'
                            BorderStyle="None"></asp:Image>
                        <asp:LinkButton ID="lbAddAttribute" runat="server" CssClass="link" CommandName="Add" Text="Add New Attribute" CausesValidation="false"></asp:LinkButton>
                    </td>
                </tr>

                <tr id="addNewContainer" runat="server" visible="false">
                    <td class="body" align="left" width="20%">
                        <asp:RequiredFieldValidator ID="valName" runat="server" Display="Dynamic" ErrorMessage="Attribute Name required"
                            ControlToValidate="txtAttributeName">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtAttributeName" runat="server" MaxLength="50" />
                    </td>
                    <td class="body" align="left" width="40%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Attribute Description required"
                            ControlToValidate="txtDescription">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtDescription" runat="server" MaxLength="500" style="width: 300px;" />
                    </td>
                    <td class="body" align="left" width="10%">
                        <asp:DropDownList ID="ddlAttributeValueType" runat="server" />                        
                    </td>
                    <td class="body" align="left" width="20%">
                        (associate to object after creation)
                    </td>
                    <td align="center">
                        <asp:LinkButton ID="lbInsert" runat="server" CausesValidation="True" CommandName="Insert">
                            <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/save.gif" BorderWidth="0"
                                ToolTip='Save' /></asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel">
                            <asp:Image ID="Image3" runat="server" ImageUrl="/Content/images/admin/cancel.gif" BorderWidth="0"
                                ToolTip='Cancel' /></asp:LinkButton>
                    </td>
                </tr>
            </FooterTemplate>
        </asp:DataList>
    </table>

    <br /><br />
    <asp:button ID="btn" runat="server" style="visibility: hidden;" /> <!-- dummy button for use by modal popup -->
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpePopup" TargetControlID="btn"
        PopupControlID="pnlModalPopUpPanel" BackgroundCssClass="modalBackground"
        PopupDragHandleControlID="pnlModalPopUpPanel" DropShadow="true" />

    <asp:Panel ID="pnlModalPopUpPanel" runat="server" CssClass="modalPopup" Style='display: none; width: 800px; padding: 5px; height: 400px;'>
        <br />
        <span class="header"><font color="blue">Attributes Manager</font> </span>
        <br /><br />
        Attribute Name: <asp:Label ID="lblAttributeName" runat="server" Font-Bold="true" />
        <asp:HiddenField ID="hidAttributeId" runat="server" />
        <br /><br />
        <table border="1" cellpadding="2" cellspacing="0">
            <tr class="header">
                <td class="ibn-sectionheader">Object</td>
                <td class="ibn-sectionheader">Object Attribute Type</td>
                <td class="ibn-sectionheader">Description</td>
                <td class="ibn-sectionheader">Display Label</td>
            </tr>
            <asp:DataList ID="dlAssociations" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" 
                OnItemDataBound="dlAssociations_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:CheckBox ID="chkObjectAssociation" runat="server" />
                            <asp:HiddenField ID="hidObjectId" runat="server" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlObjectAttributeType" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtDescription" runat="server" MaxLength="500" style="width: 300px;" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtDisplayLabel" runat="server" MaxLength="100" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
        </table>

        <br />

        <asp:Button ID="btnCancelModalPopup" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancelModalPopup_Click" />&nbsp;

        <asp:Button ID="btnSaveOrder" runat="server" Text="Save" OnClick="btnSaveOrder_Click" />
    </asp:Panel>

    <script type="text/javascript">
        var ctlId = '<asp:Literal ID="litFocusCtrlId" runat="server" />';
        if (ctlId != '' && document.getElementById(ctlId) != null)
            document.getElementById(ctlId).focus();
    </script>
</asp:Content>


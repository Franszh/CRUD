<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CRUD.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style>
        #container {
            position:absolute;
            width:400px;
            border: solid 1px;
            height:500px;
            background-color: #969292;
        }
        .labels {
            display:block;
            margin-top:20px;
        }
        #Titulo1 {
            text-align:center;
        }
        #container2 {
            width: 400px;
            height: 500px;
            position:absolute;
            right:0;
            border: solid 1px blue;
            background-color:#ebb791;
            
        }
        #Titulo2 {
            text-align:center;
        }
        #btnEditarRegistro {
            margin-left:60px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <asp:Label ID="Titulo1" CssClass="labels" runat="server" Text="Administrar Cuentas"></asp:Label>
            <asp:Label ID="LabelDescripcion" CssClass="labels" runat="server" Text="Cargar Cuenta"></asp:Label>
            <asp:TextBox ID="TextBoxCargarDesc" runat="server"></asp:TextBox>
            <asp:Button ID="btn1CargarCuenta" runat="server" Text="Cargar" OnClick="btn1CargarCuenta_Click" />
            <asp:Label ID="Label1" CssClass="labels" runat="server" Text="Editar Cuenta"></asp:Label>
            <asp:DropDownList ID="DropDownListEditCuenta" runat="server" DataTextField="descripcion" DataValueField="cuentas_id" DataSourceID="SqlDataSource1"></asp:DropDownList>
            <asp:TextBox ID="TextBoxEditCuenta" runat="server"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="Editar" OnClick="EditarCuenta_Click" />


            <asp:Label ID="LabelEliminarCuenta" CssClass="labels" runat="server" Text="Eliminar Cuenta"></asp:Label>
            <asp:DropDownList ID="DropDownListElimCuen" runat="server" DataTextField="descripcion" DataValueField="cuentas_id" DataSourceID="SqlDataSource1" AutoPostBack="True" OnSelectedIndexChanged="DropDownListElimCuen_SelectedIndexChanged"></asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="Eliminar Cuenta" OnClick="EliminarCuenta_Click" />

            <asp:Label ID="LabelMostrarCuenta" CssClass="labels" runat="server" Text="Cuentas: "></asp:Label>
            
            <asp:Table ID="Table1" runat="server" GridLines="Both"></asp:Table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBString %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [cuentas_id] = @cuentas_id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [cuentas_id] = @cuentas_id" ProviderName="System.Data.SqlClient">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownListElimCuen" Name="cuentas_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBoxCargarDesc" Name="descripcion" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBoxEditCuenta" Name="descripcion" Type="String"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="DropDownListEditCuenta" Name="cuentas_id" Type="Int32"></asp:ControlParameter>
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDSTabla1" runat="server" ConnectionString="<%$ ConnectionStrings:DBString %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [cuentas_id] = @cuentas_id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT descripcion FROM Cuentas" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [cuentas_id] = @cuentas_id">
                <DeleteParameters>
                    <asp:Parameter Name="cuentas_id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String"></asp:Parameter>
                    <asp:Parameter Name="cuentas_id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            
        </div>

        <div id="container2">
            <asp:Label ID="Titulo2" CssClass="labels" runat="server" Text="Registro contables"></asp:Label>
            <asp:Label ID="LabelElegirCue" CssClass="labels" runat="server" Text="Elegir cuenta"></asp:Label>
            <asp:DropDownList ID="DropDownListCuenta" runat="server" AutoPostBack="True" DataTextField="descripcion" DataValueField="cuentas_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DropDownListCuenta_SelectedIndexChanged"></asp:DropDownList>

            <asp:Label ID="LabelMonto" CssClass="labels" runat="server" Text="Monto"></asp:Label>
            <asp:TextBox ID="TextBoxMonto" runat="server"></asp:TextBox>

            <asp:Label ID="LabelTipo" CssClass="labels" runat="server" Text="Elegir Tipo"></asp:Label>
            <asp:DropDownList ID="DropDownListTipo" runat="server" >
                <asp:ListItem Text="0" Value="False"></asp:ListItem>
                <asp:ListItem Text="1" Value="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="ButtonCargarRegistro" runat="server" Text="Cargar Registro" OnClick="CargarRegistro_Click" />
            <asp:Button runat="server" Text="Editar Registro" OnClick="EditarRegistro_Click" ID="btnEditarRegistro"></asp:Button>

            <asp:Label ID="LabelEliminarRe" CssClass="labels" runat="server" Text="Eliminar Registro"></asp:Label>
            <asp:DropDownList ID="DropDownListElimReg" runat="server" DataTextField="descripcion" DataValueField="ReCo_Id" DataSourceID="sqlDataSource2" OnSelectedIndexChanged="DropDownListElimReg_SelectedIndexChanged"></asp:DropDownList>
            <asp:Button ID="Button3" runat="server" Text="Eliminar Registro" OnClick="EliminarRegistro_Click" />

            <asp:Label ID="LabelMostrarRe" CssClass="labels" runat="server" Text="Registros: "></asp:Label>
            
            <asp:Table ID="Table2" runat="server" GridLines="Both"></asp:Table>
            <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:DBString %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [ReCo_Id] = @ReCo_Id" InsertCommand="INSERT INTO [RegistrosContables] ([idCuenta], [monto], [tipo]) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT RegistrosContables.ReCo_Id, RegistrosContables.idCuenta, RegistrosContables.monto, RegistrosContables.tipo, Cuentas.descripcion FROM Cuentas INNER JOIN RegistrosContables ON Cuentas.cuentas_id = RegistrosContables.idCuenta" UpdateCommand="UPDATE RegistrosContables SET monto = @monto, tipo = @tipo WHERE (ReCo_Id = (SELECT ReCo_Id FROM RegistrosContables AS RegistrosContables_1 WHERE (idCuenta = @idCuenta)))" ID="sqlDataSource2">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownListElimReg" Name="ReCo_Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBoxMonto" Name="monto" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownListCuenta" Name="idCuenta" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownListTipo" Name="tipo" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                     <asp:ControlParameter ControlID="TextBoxMonto" Name="monto" Type="Int32" />
                     <asp:ControlParameter ControlID="DropDownListCuenta" Name="idCuenta" Type="Int32" />
                     <asp:ControlParameter ControlID="DropDownListTipo" Name="tipo" Type="Boolean" />
                    
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDSTabla2" runat="server" ConnectionString="<%$ ConnectionStrings:DBString %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [ReCo_Id] = @ReCo_Id" InsertCommand="INSERT INTO [RegistrosContables] ([idCuenta], [monto], [tipo]) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT RegistrosContables.monto, RegistrosContables.tipo, Cuentas.descripcion FROM RegistrosContables INNER JOIN Cuentas ON RegistrosContables.idCuenta = Cuentas.cuentas_id" UpdateCommand="UPDATE [RegistrosContables] SET [idCuenta] = @idCuenta, [monto] = @monto, [tipo] = @tipo WHERE [ReCo_Id] = @ReCo_Id">
                <DeleteParameters>
                    <asp:Parameter Name="ReCo_Id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="idCuenta" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="monto" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="tipo" Type="Boolean"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idCuenta" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="monto" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="tipo" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="ReCo_Id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            


        </div>
    </form>
</body>
</html>

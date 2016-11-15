<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="COSC4210.MusicalIntruments.Web.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
<body>
    <header id="top">
        <h1>Collection of Musical Instruments</h1>
    </header>

    
    <br />
     <section>
         <h2 id="entities">Entities</h2>
         <p>
             A musical instrument entity would contain the following fields (all are required):
             <ul>
                 <li>Price (Double)</li>
                 <li>Brand (String)</li>
                 <li>Name (String)</li>
             </ul>
             <p>
                 Where Price is its price in dollar, brand its make, and Name is what instrument it is (ex: violin).
             </p>
         </p>
         

     </section>
    

    <br />
    <section>
        <h2 id="types">Types (one to many)</h2>
        <p>
            A musical instrument entity would contain the following types:
            <ul>
                <li>Woodwind
                    <ul>
                        <li>Example: Flutes, Clarinets </li>
                    </ul>
                </li>
                <li>
                    Strings
                    <ul>
                        <li>Example: Violin, Guitar</li>
                    </ul>
                </li>
                <li>
                    Brass
                    <ul>
                        <li>Example: Trombone, Trumpet</li>
                    </ul>
                </li>
                <li>
                    Percussion
                    <ul>
                        <li>Example: Snare Drum, Cymbal</li>
                    </ul>
                </li>
            </ul>
        </p>


    </section>
   
    <br />
    <section>
        <h2 id="categories">Categories (many to many)</h2>
        <p>
            A musical instrument entity would could fall under the following categories.
            One instrument may fall under few or many of these categories, but some instruments 
            cannot fall under two specific categories. For example, an instrument cannot be both
            new and old, or both loud and quiet.
           
             <ul>
                <li>New</li>
                <li>Old</li>
                <li>Good Sound</li>
                <li>Poor Sound</li>
                <li>Loud</li>
                <li>Quiet</li>
                <li>Consonant
                    <ul>
                        <li>Sounds correct, most instruments (piano, guitar, etc)</li>
                    </ul>
                </li>
                <li>Dissonant
                    <ul>
                        <li>Sounds slightly off, like an organ, acordian, or bagpipe</li>
                    </ul>
                </li>

            </ul>
        </p>
        </section>
</asp:Content>

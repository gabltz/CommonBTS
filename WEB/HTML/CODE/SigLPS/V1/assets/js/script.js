// Tableau associatif pour stocker les adresses correspondant à chaque clinique
const adresses = {
    "Clinique Louis Pasteur - ": "7 rue Parmentier, 54270 Essey Les Nancy",
    "Clinique La Ligne Bleue - ": "9 Avenue du Rose Poirier, 88000 Épinal",
    "Clinique Ambroise Paré - ": "21 Route de Guentrange, 57100 Thionville",
    "Clinique Jeanne d'Arc - ": "26 Rue Charles Vue, 54300 Lunéville",
};

const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const telRegex = /^\d{10}$/;

function isValidEmail(email) {
    return emailRegex.test(email);
}

function isValidTel(tel) {
    return telRegex.test(tel);
}

function generateSignature() {
    const nom = document.getElementById("nom").value; // Récupérer le nom
    const prenom = document.getElementById("prenom").value; // Récupérer le prénom
    const poste = document.getElementById("poste").value; //  Récupérer le titre professionnel
    const getEmail = document.getElementById("getEmail").value; // Récupérer l'adresse e-mail
    if (!isValidEmail(getEmail)) { // Vérifier si l'adresse e-mail est valide
        alert("Veuillez saisir une adresse e-mail valide.");
        return;
    }
    const mailToEmail = "mailto:" + getEmail; // Ajouter le préfixe mailto: à l'adresse e-mail
    const tel = document.getElementById("tel").value; // Récupérer le numéro de téléphone
    if (!isValidTel(tel)) { // Vérifier si le numéro de téléphone est valide
        alert("Veuillez saisir un numéro de téléphone valide.");
        return;
    }
    





    const clinique = document.getElementById("clinique").value; // Récupérer la clinique sélectionnée
    const adresse = adresses[clinique]; // Récupérer l'adresse correspondant à la clinique sélectionnée

    

    const signatureHTML = `
    <table border="0" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
<tbody>
<tr>
<td width="183" valign="top" style="width:137.25pt;padding:4.0pt 4.0pt 4.0pt 4.0pt">
  <p class="MsoNormal">
    <span style="font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif">
      <img style="width:134.55pt;padding:0cm 5.4pt" width="179" id="m_9019737573573625911Image_x0020_1" src="https://www.louispasteursante.com/wp-content/uploads/2021/12/Logo-LouisPasteurSante_1.png" alt="Louis Pasteur Santé LORRAINE " data-image-whitelisted="" class="CToWUd" data-bit="iit">
      
    </span>
  </p>
  <p class="MsoNormal">
    <span>&nbsp; <u></u>
      <u></u>
    </span>
  </p>
</td>
<td width="466" valign="top" style="width:349.8pt;padding:4.0pt 4.0pt 4.0pt 4.0pt">
  <p class="MsoNormal" style="margin-top:3.0pt">
    <b>
      <span style="font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#008d36">${prenom} ${nom}</span><span style="font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#008d36"> | ${poste}<u></u>
    </b>
    <span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#008d36">&nbsp;</span>
    <span style="font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#008d36">&nbsp;</span>
    <span style="font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif">
      <u></u>
    </span>
  </p>
  
  <p class="MsoNormal" style="margin-top:3.0pt">
            <b>
                <span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1f497d">${clinique}&nbsp;</span>
            </b>
            <span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;,serif">
                <a href="https://www.google.com/maps/search/${encodeURIComponent(adresse)}?entry=gmail&amp;source=g" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://www.google.com/maps/search/${encodeURIComponent(adresse)}?entry%3Dgmail%26source%3Dg&amp;source=gmail&amp;ust=1690528669786000&amp;usg=AOvVaw2HV5A-LM--6IEeQO4esKTE">
                    <span style="font-family:&quot;Arial&quot;,sans-serif;color:blue">${adresse}</span>
                </a>
            </span>
            <span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;,serif">
                <u></u>
                <u></u>
            </span>
        </p>
  <p class="MsoNormal" style="margin-top:3.0pt">
    <span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1f497d">Tel : <a href="tel:${tel}">${tel}</a><u></u>
      <u></u>
    </span>
  </p>
  <p class="MsoNormal" style="margin-top:3.0pt">
    <span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1f497d">E-Mail : <a href="${mailToEmail}">${getEmail}</a><br><u></u>
      <u></u>
    </span>
  </p>
  <p class="MsoNormal" style="margin-top:3.0pt">
    <span style="font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#445e7d">Découvrez notre site web groupe&nbsp;</span>
    <span style="font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif">
      <a href="https://urldefense.com/v3/__http:/www.louispasteursante.com/__;!!J748QdifiTU!h0zfdHvlCPszN_IXr-V-y-lK072I9ODcPy5zrsTrIaZkflQftnAz80TQnqLYdUI27Au7Jxf7JmRxNtLqe_itErD359ldvPkAE_sG4HA$" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://urldefense.com/v3/__http:/www.louispasteursante.com/__;!!J748QdifiTU!h0zfdHvlCPszN_IXr-V-y-lK072I9ODcPy5zrsTrIaZkflQftnAz80TQnqLYdUI27Au7Jxf7JmRxNtLqe_itErD359ldvPkAE_sG4HA$&amp;source=gmail&amp;ust=1690528669786000&amp;usg=AOvVaw2px6lK9L4LAHyuJpprGVDx">
        <b>
          <span style="color:blue">louispasteursante.com</span>
        </b>
      </a>
      <u></u>
      <u></u>
    </span>
  </p>
  <p class="MsoNormal">
    <span style="font-family:&quot;Arial&quot;,sans-serif;color:black">&nbsp; <u></u>
      <u></u>
    </span>
  </p>
</td>
</tr>
</tbody>
</table>
<p class="MsoNormal">
<span>
<u></u>&nbsp; <u></u>
</span>
</p>
<p class="MsoNormal">
<u></u>&nbsp; <u></u>
</p>
    `;


    document.getElementById("signatureResult").innerHTML = signatureHTML;

    const signatureTextarea = document.getElementById("signatureTextarea");
    signatureTextarea.value = signatureHTML
}

function openSignature() {
    const signatureTextarea = document.getElementById("signatureTextarea");
    const signatureText = signatureTextarea.value;

    const signatureWindow = window.open('', '_blank');
    signatureWindow.document.write('<!DOCTYPE html>');
    signatureWindow.document.write('<html lang="fr">');
    signatureWindow.document.write('<head>');
    signatureWindow.document.write('<meta charset="UTF-8">');
    signatureWindow.document.write('<meta name="viewport" content="width=device-width, initial-scale=1.0">');
    signatureWindow.document.write('<title>Signature</title>');
    signatureWindow.document.write('</head>');
    signatureWindow.document.write('<body>');
    signatureWindow.document.write(signatureText);
    signatureWindow.document.write('</body>');
    signatureWindow.document.write('</html>');
    signatureWindow.document.close();
}

// Fonction pour mettre à jour l'adresse en fonction du choix de la clinique
function updateAddress() {
    const clinique = document.getElementById("clinique").value;
    const adresse = adresses[clinique];
    document.getElementById("adresse").value = adresse; // Mettre à jour l'adresse dans le champ de texte
}

// Appeler updateAddress() une fois au chargement de la page pour afficher l'adresse initiale
updateAddress();
Ext.QuickTips.init();							//n閏essaire pour initialiser les infobulles d抏rreur
Ext.form.Field.prototype.msgTarget = 'side';	//n閏essaire pour initialiser les infobulles d抏rreur


function fct_inscription(btn){
	//Fonction pour rediriger l'utilisateur sur la m阭e page o?il se trouve.
	location.replace = location.href;
}

//Fonction appel閑 en cliquant sur submit du formulaire
function fct_submit()
{
	if (login.getForm().isValid()) {
		var sb = Ext.getCmp('statusbar');
		sb.showBusy('Connexion ...');
		login.getEl().mask();

	   login.form.submit({			//similaire ?la m閠hode post
		url: 'log_post.php',		//URL de la page sur laquelle on effectue la m閠hode post
		method: 'POST',

		reset: false,			//pour ne pas reseter les formulaires en cas d'閏hec
		
		//Si une erreur est survenue lors du POST
		failure: function(result, action)
		{
			//L'objet JSON vas rechercher dans lire le r閟ultat du POST et le d閏oder
			obj = Ext.util.JSON.decode(action.response.responseText);
			//S'il s'agit d'une phrase g閚閞ale on l'affiche(errors = type d'action ; reason : nom de l'action, on peut nommer cela comme on veut dans le formulaire post)
			var message = obj.errors.reason;	
			
			//si le message n'inclue pas un ID pr閏is d'un champ de notre formulaire, on affiche simplement un message d'erreur g閚閞al dans notre status bar, et non a droite du champ concern?
			if (message == undefined) message = obj.errors[0].msg;		
				
			sb.setStatus({		//On modifie le texte de notre status bar
				text:'Erreur : '+ message, 
				iconCls:'',
				clear: true
			});
		}, //fin de la fonction failure

		//S'il n'y a pas eu d'erreur dans notre POST...
		success: function(result, action)
		{
			//Message de bienvenue
			obj = Ext.util.JSON.decode(action.response.responseText);
			var message = obj.msg.reason;		//on recherche le message ?afficher
			sb.setStatus({
				text:'Authentification r閡ssie : '+ message, 
				iconCls:'',
				clear: true
			});
			//msgbox affichant le message de connexion, puis redirige l'utilisateur s'il clique sur ok
			Ext.MessageBox.alert('Bienvenue', message, fct_inscription);
			
		}	//fin de la fonction success

	});	//fin du submit
	}
//	else
//	{		//Si le formulaire n'est pas valide, on change la phrase dans notre status bar
//		sb.setStatus({
//			text:'Erreur : Formulaire non valide.', 
//			iconCls:'',
//			clear: true
//		});
//	}
	login.getEl().unmask();
}


	
	
//Login, il s'agit d'un panel contenant le formulaire avec les champs login, password...
var login = new Ext.FormPanel({
	id: 'login',				//id de la fen阾re
	frame: true, 				//pour que tous les items soient dans la m阭e frame
	autoWidth:true,
	autoHeight:true,
	labelWidth:  135, 			//largeur des labels des champs
	defaults: {width: 230}, 	//largeur des champs
	labelAlign: 'right',			//les labels s'aligneront a droite		
	bodyCfg: {tag:'center', cls:'x-panel-body'},		//on aligne tous les champs au milieu de la fen阾re
	bodyStyle: 'padding:5p;margin:0px;', 
	//defaultType: 'textfield',

	items: [{		//Ici, on affiche ?la suite tous les champs que l'on veut mettre
			xtype: 'textfield',
			fieldLabel: 'Adresse Email', 		// = label de description du champ
			id: 'email', 
			name: 'email', 
			vtype: 'email', 	//V閞ification type : met un masque d'adresse email sur ce champ
			vtypeText: 'Votre adresse email doit 阾re de la forme de "user@domain.com"',
			//message si email non valide
			allowBlank: false,				//champ obligatoire pour poster le formulaire
			blankText:"Veuillez saisir votre adresse email."	//message si le champ n'est pas rempli
		},{ 
			xtype: 'textfield',
			fieldLabel: 'Mot de passe', 
			id: 'pass', 
			name: 'pass', 
			allowBlank: false, 
			inputType: 'password',
			blankText:"Veuillez saisir votre mot de passe."
		},{
			xtype:'checkbox',  
			boxLabel : ' ',
			fieldLabel: 'Se souvenir de moi',
			checked: true,
			style: 'left:0px;position:relative;',
			name: 'save'
		},{
			xtype: 'hidden',		//Balise cach閑 afin de dire qu'il s'agit d'une connexion
			id: 'connexion',
			name: 'connexion'
		},{
			html: '<a class="lien" href="recup.php">Mot de passe oubli?</a>',	
		//dans les balises html: on peut mettre n'importe quel code html
			bodyStyle:
			{
				paddingTop: '20px'
			}
		},{
			html: '<a class="lien" href="inscrip.php">Cr閑r un nouveau compte</a>'
		}],
		buttons: [{
			text: 'Se connecter', 
			handler: fct_submit	//fonction ?appeler lorsque l'on clique sur le bouton
		}]
}); 
	

var login_total = new Ext.Panel({
	autoWidth:true,
	autoHeight:true,
	// height: 100,
	layout:'fit',
	items: login,
	bbar: new Ext.ux.StatusBar({
	    id: 'statusbar',
	    // defaults to use when the status is cleared:
	    defaultText: 'Default status text',
	    // defaultIconCls: 'default-icon',
	        
	    // values to set initially:
	    text: 'Ready',
	    iconCls: 'x-status-valid',
	    plugins: new Ext.ux.ValidationStatus({form:'login'})

	})

});



var win_login;

if (!win_login) {
	win_login = new Ext.Window({
		title: 'Authentification',
		el: 'popup_log_window',
		width:450,
		closable:true,
		autoHeight:true,
		modal:true,
		closeAction:'hide',
		items: login_total
	});
}

function show_win_login() {
	win_login.show();
}


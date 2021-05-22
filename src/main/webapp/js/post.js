const likeBtn = document.getElementsByClassName('like-btn');

const dislikeBtn = document.getElementsByClassName('dislike-btn');

function updateLike()
{
	let likes = this.querySelector('.like');
	if(this.classList.contains('selected'))
	{
		likes.innerHTML = Number(likes.innerHTML) - 1;
		this.classList.remove('selected');		
	}else{
		likes.innerHTML = Number(likes.innerHTML) + 1;
		this.classList.add('selected');	
	}
	
}

function updateDislike()
{
	let dislikes = this.querySelector('.dislike');
	if(this.classList.contains('selected'))
	{
		dislikes.innerHTML = Number(dislikes.innerHTML) - 1;
		this.classList.remove('selected');		
	}else{
		dislikes.innerHTML = Number(dislikes.innerHTML) + 1;
		this.classList.add('selected');	
	}
}

for(let i = 0; i < likeBtn.length; i++)
{
	likeBtn[i].addEventListener("click", updateLike);
	dislikeBtn[i].addEventListener("click", updateDislike);
}


function verify()
{
	if(window.confirm("Are you sure you want to delete?"))
	{
		document.getElementsByName("deletepost")[0].submit();
	}
}

// Called when user delete its own account
function deleteAccount()
{
	if(window.confirm("Are you sure you want to delete account?"))
	{
		document.getElementsByName("accountDelete")[0].submit();
	}
}

// Called when admin delete a users account
function deleteUser()
{
	let userOfDeletion = window.prompt("Enter Username to delete");
	document.getElementsByName("userOfDeletion")[0].value = userOfDeletion;
	document.getElementsByName("DeleteUser")[0].submit();
}


 // submits form for updating likes 
function changeLike(postId)
{
	document.querySelectorAll(`form.like-form[name = ${CSS.escape(postId)}]`)[0].submit();
}


 // submits form for updating likes and dislikes
function changeDislike(postId)
{
	document.querySelectorAll(`form.dislike-form[name = ${CSS.escape(postId)}]`)[0].submit();
}
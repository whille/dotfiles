install:
	today=`date +%Y%m%d_%s`
	mv ~/.vim/bundle ~/bundle_$today
	mv ~/.vimrc ~/.vimrc_$today
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd` ~/.vim
	ln -s `pwd`/vimrc ~/.vimrc
	mv ~/bundle_$today ~/.vim/bundle

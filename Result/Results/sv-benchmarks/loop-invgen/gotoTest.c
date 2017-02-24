int main()
{
  int tagbuf_len;
  int t;
  
  tagbuf_len = __VERIFIER_nondet_int();
  if(tagbuf_len >= 1){
	goto END;
}

  t = 0;

  tagbuf_len=tagbuf_len-1;

  while (1) {
    if (t == tagbuf_len) {
      goto END;
    }
    if (__VERIFIER_nondet_int()) {
      break;
    }
    t=t+1;
  }


  t=t+1;

  while (1) {

    if (t == tagbuf_len) { 
      goto END;
    }

    if (__VERIFIER_nondet_int()) {
      if ( __VERIFIER_nondet_int()) {

        t=t+1;
        if (t == tagbuf_len) {
          goto END;
        }
      }
    }
    else if ( __VERIFIER_nondet_int()) {
      break;
    }

    t=t+1;                
  }

 END:
  return 0;
}

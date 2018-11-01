#include<bits/stdc++.h>

using namespace std;
struct ElemType {
    int location;
    int psw;
};

#include "DuLinkList.h"
bool Equal( ElemType &a, ElemType &b ){
    if ( a.location == b.location && a.psw == b.psw )
        return true;
    else
        return false;
}
//匹配ListTrverse函数中的函数参量Visit，输出的项数由数据元素类型决定

void Print( ElemType e )
{
    cout << " 位置: " << e.location << " 密码: " << e.psw << endl;
}

//在瑟夫环中依次出列
void Ysfring( DuLinkList &L, int n, int m )
{
    struct DuLNode *current , *s;
    // 第一个元素出列
	m = m % n ;
	current = GetElemP(L,m - 1);
	s = current -> next;
    current -> next = s -> next;
    s -> next -> prior = current;
    cout << endl << "第1个出列的位序是: " << s -> date.location;
    m = s -> date.psw;
    delete s;
    n--;
    int k = n;
    while ( n > 0 )
    {
		//模运算，提高查找效率
        m = m % n;
        if ( m == 0 ){
             m = n;
             current  = current ->next;  //若m=n此时current最终定为它本身,肯定 采用逆序查找,所以需要将current向后移动 
        }
        // 根据 m 的大小合理采用顺序逆序查找,提高效率
		if(m > (n + 1) / 2){  // m > n 的一半 , 采用逆序查找
			for ( int j = 1; j < n - m ; j++ )
            	current = current -> prior;
            s = current -> prior;
        	current -> prior = s -> prior;
        	s -> prior -> next = current;
			current = current -> prior;  //若采用逆序查找,此时current为s的后继结点,需要将current更正为s的前驱结点便于继续运算.!
		}
        else{			//m <= n 的一半 , 采用顺序查找
        	for ( int j = 1; j < m ; j++ )
           		current = current -> next;
            s = current -> next;
        	current -> next = s -> next;
        	s -> next -> prior = current;
		}
        cout << endl << "第" << k - n + 2 << "个出列的位序是: " << s -> date.location;
        m = s -> date.psw;
        delete s;
        n--;
    }
    L -> next  = L;
    L -> prior = L;
}
int main()
{
     DuLinkList L;
     InitList(L);
     int n, m;
     ElemType p;
     cout << "《约瑟夫环》" << endl << endl;
     cout << "请输入人数: " << endl;
     cin >> n;
     for ( int i = 1 ; i <= n; i++ )
     {
         cout << "请输入第" << i << "人密码: ";
         cin >> p.psw ;
         p.location = i;
         ListInsert(L,i,p);
     }
     cout << endl << "当前循环单链表中的数据元素依序为：" << endl << endl;
     ListTraverse( L, Print );
     cout << endl << "请输入初始密码: ";
     cin >> m;
     Ysfring( L, n, m );
     cout << endl << endl;
     system( "pause" );
     return 0;
}




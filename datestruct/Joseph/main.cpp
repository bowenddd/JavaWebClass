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
//ƥ��ListTrverse�����еĺ�������Visit�����������������Ԫ�����;���

void Print( ElemType e )
{
    cout << " λ��: " << e.location << " ����: " << e.psw << endl;
}

//��ɪ�������γ���
void Ysfring( DuLinkList &L, int n, int m )
{
    struct DuLNode *current , *s;
    // ��һ��Ԫ�س���
	m = m % n ;
	current = GetElemP(L,m - 1);
	s = current -> next;
    current -> next = s -> next;
    s -> next -> prior = current;
    cout << endl << "��1�����е�λ����: " << s -> date.location;
    m = s -> date.psw;
    delete s;
    n--;
    int k = n;
    while ( n > 0 )
    {
		//ģ���㣬��߲���Ч��
        m = m % n;
        if ( m == 0 ){
             m = n;
             current  = current ->next;  //��m=n��ʱcurrent���ն�Ϊ������,�϶� �����������,������Ҫ��current����ƶ� 
        }
        // ���� m �Ĵ�С�������˳���������,���Ч��
		if(m > (n + 1) / 2){  // m > n ��һ�� , �����������
			for ( int j = 1; j < n - m ; j++ )
            	current = current -> prior;
            s = current -> prior;
        	current -> prior = s -> prior;
        	s -> prior -> next = current;
			current = current -> prior;  //�������������,��ʱcurrentΪs�ĺ�̽��,��Ҫ��current����Ϊs��ǰ�������ڼ�������.!
		}
        else{			//m <= n ��һ�� , ����˳�����
        	for ( int j = 1; j < m ; j++ )
           		current = current -> next;
            s = current -> next;
        	current -> next = s -> next;
        	s -> next -> prior = current;
		}
        cout << endl << "��" << k - n + 2 << "�����е�λ����: " << s -> date.location;
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
     cout << "��Լɪ�򻷡�" << endl << endl;
     cout << "����������: " << endl;
     cin >> n;
     for ( int i = 1 ; i <= n; i++ )
     {
         cout << "�������" << i << "������: ";
         cin >> p.psw ;
         p.location = i;
         ListInsert(L,i,p);
     }
     cout << endl << "��ǰѭ���������е�����Ԫ������Ϊ��" << endl << endl;
     ListTraverse( L, Print );
     cout << endl << "�������ʼ����: ";
     cin >> m;
     Ysfring( L, n, m );
     cout << endl << endl;
     system( "pause" );
     return 0;
}




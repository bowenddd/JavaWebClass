#include<bits/stdc++.h>
using namespace std;

# define TRUE 1
# define FALSE 0
# define OK 1
# define ERROR 0
# define INFEASIBLE -1
# define OVERFLOW -2
# define STACK_INIT_SIZE 100
# define STACKINCREMENT 10
typedef int Status;

//构造双向循环链表储存结构
typedef struct DuLNode{
	ElemType date;
	DuLNode *prior,*next;
}DuLNode,*DuLinkList;

//产生空的双向循环链表
void InitList(DuLinkList &L) {
	L = (DuLinkList)malloc(sizeof(DuLNode));
	if(L){
		L -> next = L ;
		L -> prior = L ;
	}
	else{
		exit(OVERFLOW);
	}
}

//销毁双向循环链表
void DestoryList(DuLinkList &L) {
	DuLinkList p , q;
	p = L -> next;
	while(p != L){
		q = p ->next;
		free(p);
		p = q;
	}
	free(L);
	L = NULL;
}


//重置链表为空表
void ClearList(DuLinkList &L){
	DuLinkList p , q;
	p = L -> next;
	while(p != L){
		q = p -> next;
		free(p);
		p = q;
	}
	L -> next = L ;
	L -> prior = L;
}

//验证是否为空表
Status ListEmpty(DuLinkList L){
	if(L -> next == L && L -> prior == L){
		return TRUE;
	}
	else return FALSE;
}


// 计算表内元素个数

int ListLength(DuLinkList L){
	int i = 1;
	DuLinkList p = L;
	while(p -> next != L ){
		i++;
		p = p -> next;
	}
	return i;
}

// 赋值(当第i个元素存在时将其值赋给e并返回OK,否则返回ERROR)
Status GetElem(DuLinkList L , int  i , ElemType &e){
	int j = 1;
	DuLinkList p = L ;
	while(p -> next != L && j < i){
		p = p -> next;
		j++;
	}
	if(p -> next  == L && j > i)    return ERROR;// 第i个元素不存在
	e = p -> date;
	return OK;
}

// 查找元素
int LocateElem(DuLinkList L ,ElemType &e , bool(*compare(ElemType,ElemType))){
	int i = 0;
	DuLinkList p = L ;
	while(p -> next != L){
		i++;
		if(compare(p ->date , e))	return i;
		p = p -> next;
	}
	return 0;
}

// 查找元素前驱
Status PriorElem(DuLinkList L , ElemType cur_e , ElemType &pre_e){
	DuLinkList p = L -> next ;
	while(p -> next != L){
		if(p -> date.psw== cur_e.psw){
			pre_e = p -> prior -> date;
			return TRUE;
		}
		p = p -> next;
	}
	return FALSE;
}

//查找元素后记
Status NextElem(DuLinkList L , ElemType cur_e , ElemType &next_e){
	DuLinkList p = L -> next ;
	while(p -> next != L){
		if(p -> prior -> date.psw== cur_e.psw){
			next_e = p -> date;
			return TRUE;
		}
		p = p -> next;
	}
	return FALSE;
}

// 查找元素地址
DuLinkList GetElemP(DuLinkList L , int i){
	DuLinkList p = L;
	if(i < 0 || i > ListLength(L)){
		return ERROR;
	}
	for(int j = 1 ; j < i ; j++ ){
		p = p -> next;
	}
	return p;
}

//插入元素
Status ListInsert(DuLinkList &L , int  i , ElemType e){
	DuLinkList p , s;
	if(i < 1 || i > ListLength(L) + 1 )    return ERROR;
	if(i == 1){
                L -> date = e;
	}
	else {
                p = GetElemP(L,i - 1);  // 确定L中第i个元素的前驱的位置的指针p
                if(!p)  return ERROR; //p = NULL ,第i个元素的前驱不存在,返回ERROR(第一个元素的前驱是头结点)
                s = (DuLinkList)malloc(sizeof(DuLNode));
                if(!s)	return OVERFLOW;
                s -> date = e;
                s -> prior = p;
                s -> next = p -> next;
                p -> next -> prior = s;
                p -> next = s;
                return OK;
	}
}

// 删除元素
Status ListDelete(DuLinkList L , int i ,ElemType &e){
	DuLinkList p;
	if(i < 1)	return ERROR;
	p = GetElemP(L,i);
	if(!p)	return ERROR;
	e = p ->date;
	p -> prior -> next = p -> next;
	p -> next -> prior = p -> prior;
	free(p);
	return OK;
}

//正序查找

void ListTraverse(DuLinkList L ,void (*visit)(ElemType)){
	DuLinkList p = L ;
	while(p -> next != L){
		visit(p -> date);
		p = p -> next;
	}
	visit(p -> date);
	cout <<  endl;
}

//逆序查找
void ListTraverseBack(DuLinkList L, void(*visit(ElemType e))){
	DuLinkList p = L -> prior;
	while(p != L){
		visit(p -> date);
		p = p -> prior;
	}
        visit(p -> date);
	cout << endl;
}


















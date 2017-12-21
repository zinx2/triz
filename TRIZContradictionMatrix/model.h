#pragma once
#include <QObject>
#include <QMap>
#include <QList>

class Concept : public QObject {
	Q_OBJECT
		Q_PROPERTY(int id READ id WRITE setId NOTIFY idChanged)
		Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
		Q_PROPERTY(QString desc1 READ desc1 WRITE setDesc1 NOTIFY desc1Changed)
		Q_PROPERTY(QString desc2 READ desc2 WRITE setDesc2 NOTIFY desc2Changed)
		Q_PROPERTY(QString desc3 READ desc3 WRITE setDesc3 NOTIFY desc3Changed)
		Q_PROPERTY(QString desc4 READ desc4 WRITE setDesc4 NOTIFY desc4Changed)
		Q_PROPERTY(QMap<int, int> extractedConcept READ extractedConcept WRITE setExtractedConcept NOTIFY extractedConceptChanged)
public:
	Concept(QObject* parent=0) : QObject(parent) { }
	/*Explorer(int id, QString name, QString path) : m_id(id), m_name(name), m_path(path) { }
	Explorer(int id, QString name, QString path, bool extended) : m_id(id), m_name(name), m_path(path), m_extended(extended) { }
	Explorer(
		int id,
		int parent,
		QString name,
		QString path,
		QList<QObject*> children) : m_id(id), m_parent(parent), m_name(name), m_path(path), m_children(children) { 	}
	Explorer(
		int id,
		int parent,
		QString name,
		QString path,
		bool extended,
		QList<QObject*> children) : m_id(id), m_parent(parent), m_name(name), m_path(path), m_extended(extended), m_children(children) { 	}*/
	Concept(int id, QString name, QString desc1 = "", QString desc2 = "", QString desc3 = "", QString desc4 = "")
		: m_id(id), m_name(name), m_desc1(desc1), m_desc2(desc2), m_desc3(desc3), m_desc4(desc4) { }
	Concept(QString name, QString desc1 = "", QString desc2 = "", QString desc3 = "", QString desc4 = "")
		: m_name(name), m_desc1(desc1), m_desc2(desc2), m_desc3(desc3), m_desc4(desc4) { }

	Q_INVOKABLE int id() const { return m_id; }	
	Q_INVOKABLE QString name() const { return m_name; }
	Q_INVOKABLE QString desc1() const { return m_desc1; }
	Q_INVOKABLE QString desc2() const { return m_desc2; }
	Q_INVOKABLE QString desc3() const { return m_desc3; }
	Q_INVOKABLE QString desc4() const { return m_desc4; }
	Q_INVOKABLE QMap<int, int> extractedConcept() { return m_extractedConcept; }	/* 1 : int, engineering varialbes number, 2 : invention concept number  */

	public slots:
	void setId(const int id) { m_id = id; }	
	void setName(const QString &m) { m_name = m; emit nameChanged(); }
	void setDesc1(const QString &m) { m_desc1 = m; emit desc1Changed(); }
	void setDesc2(const QString &m) { m_desc2 = m; emit desc2Changed(); }
	void setDesc3(const QString &m) { m_desc3 = m; emit desc3Changed(); }
	void setDesc4(const QString &m) { m_desc4 = m; emit desc4Changed(); }
	void setExtractedConcept(const QMap<int, int> &m) { m_extractedConcept = m; emit extractedConceptChanged(); }	

signals:
	void idChanged();
	void nameChanged();
	void desc1Changed();
	void desc2Changed();
	void desc3Changed();
	void desc4Changed();
	void extractedConceptChanged();

private:
	int m_id = -1;
	QString m_name;
	QString m_desc1;
	QString m_desc2;
	QString m_desc3;
	QString m_desc4;
	QMap<int, int> m_extractedConcept;
};
//Q_DECLARE_METATYPE(Concept*)



class Model : public QObject
{
	Q_OBJECT
		Q_PROPERTY(QList<QObject*> eng READ eng WRITE setEng NOTIFY engChanged)
		Q_PROPERTY(QList<Concept*> inv READ inv WRITE setInv NOTIFY invChanged)
		Q_PROPERTY(QList<QString> list READ list WRITE setList NOTIFY listChanged)
public:
	Model()
	{
		m_eng.append(new Concept("�����̴� ��ü�� ����", "�߷��忡���� ��ü�� ����. ��ü�� ��ü�� ����ü�� ������ ���ϴ� ��"));
		m_eng.append(new Concept("������ ��ü�� ����", "�߷��忡���� ��ü�� ���� (��ü�� ��ü�� ����ü�� ������, Ȥ�� ��ü�� ��ġ�� ǥ�鿡 ���ϴ� ��)"));
		m_eng.append(new Concept("�����̴� ��ü�� ����", "��ü�� �� �� ������ �Ÿ� (���� �ǹ̿��� ��ü�� �ٸ� ����� �Ÿ��� �ش���)"));
		m_eng.append(new Concept("������ ��ü�� ����", "��ü�� �� �� ������ �Ÿ� (���� �ǹ̿��� ��ü�� �ٸ� ����� �Ÿ��� �ش���)"));
		m_eng.append(new Concept("�����̴� ��ü�� ����", "��ü ǥ���� ũ�� (��ü ǥ���� �Ϻ� Ȥ�� ��ü�� ���γ� �ܺ� ǥ���� ũ�⸦ �ǹ���)"));
		m_eng.append(new Concept("������ ��ü�� ����", "��ü ǥ���� ũ�� (��ü ǥ���� �Ϻ� Ȥ�� ��ü�� ���γ� �ܺ� ǥ���� ũ�⸦ �ǹ���)"));
		m_eng.append(new Concept("�����̴� ��ü�� ����", "��ü�� �����ϴ� 3���� ���� (������ü�� ����=����x��x����, ������ ����=�ظ���x����)"));
		m_eng.append(new Concept("������ ��ü�� ����", "��ü�� �����ϴ� 3���� ���� (������ü�� ����=����x��x����, ������ ����=�ظ���x����)"));
		m_eng.append(new Concept("�ӵ�", "��ü�� �������� ���� �Ǵ� ��ġ�� �ٲٴ� ���� (��ü�� ���� �ð��� ������ �Ÿ�, �ʴ� ȸ����, �����ð� �� ����(���μ���)�̳� ������ �� ������ ǥ����) "));
		m_eng.append(new Concept("��(force)", "�ý��۵� ���� ��ȣ�ۿ� (��ư�����п��� ��=����x���ӵ��� ��������, Ʈ����� ���� ��ü�� ������ ��ȭ��Ű�� ���� � ��ȣ�ۿ��� ������ ��. ��: ȸ����)"));
		m_eng.append(new Concept("�з�(����)", "��ü�� ���� ���� �� ������ �� (������ ��ü�� �ܺο��� �������� ���� �����ؼ� ���� ����� ������Ű���� ������, �з¿� ���� ��ü�� ������ ������ �ǹ���)"));
		m_eng.append(new Concept("���(����)", "��ü�� �Ѹ�� �Ǵ� �ܺ��� ���� (����� ���빰, ���� ����, ��ġ, ����, ũ�� ���� Ư���� ������)"));
		m_eng.append(new Concept("��������� ������", "�ý����� �����ϴ� ��ҵ� ���� ������ ���� ���� (���� ȭ���� �и�, ���� ���� ��� �������� ���ҽ�Ŵ)"));
		m_eng.append(new Concept("����(strength)", "�ı��� �����ϴ� �� (��ü�� ������ �ʱ� ���ؼ� �з� �Ǵ� ���¿� �����ϴ� ��)"));
		m_eng.append(new Concept("�����̴� ��ü�� ������ (�۵� ���ӽð�)", "�ý����� ������ ���� �ʰ� �۵��� �� �ִ� �ð� (������)"));
		m_eng.append(new Concept("������ ��ü��  ������ (�۵� ���ӽð�)", "�ý����� ������ ���� �ʰ� �۵��� �� �ִ� �ð� (������)"));
		m_eng.append(new Concept("�µ�", "��ü�� ���ų� �߰ſ� ���� (������ �ǹ̿��� �µ��� ���� ��� ������ �帧�� ��ǥ�̹Ƿ�, �µ��� ��ȭ���� ������ ��ġ�� ���뷮�� ���� �µ� �Ķ���͵� �ش��)"));
		m_eng.append(new Concept("����(���) ", "���� ��⸦ ��Ÿ���� ����  (���� ���� �� ���� �����̳� �ֵ�, ���� ǰ�� ��� ���� ���� Ư���� ������)"));
		m_eng.append(new Concept("�����̴� ��ü�� ������ ��뷮", "Ư���� �۾��� �����ϱ� ���ؼ� �䱸�Ǵ� ������ (��������п����� ������=��x�Ÿ�������, Ʈ������� ����� ���� ���۽ý��ۿ� ���� �����Ǵ� �������� ��뷮�� �����ϸ�, �ý����� �Һ��� �������� ��������� �ǹ���)"));
		m_eng.append(new Concept("������ ��ü�� ������ ��뷮", "Ư���� �۾��� �����ϱ� ���ؼ� �䱸�Ǵ� ������ (��������п����� ������=��x�Ÿ�������, Ʈ������� ����� ���� ���۽ý��ۿ� ���� �����Ǵ� �������� ��뷮�� �����ϸ�, �ý����� �Һ��� �������� ��������� �ǹ���)"));
		m_eng.append(new Concept("����(power)", "�۾��� ����Ǵ� ���� �ý����� �߻��� ������ (��������� �ƴ� �߻������� �ǹ��ϸ�, �����п����� ����, ����, ǳ�� ���� �������� �����⿡ ���� ����� �������� ��ȯ�ؼ� ����Ų ���� �ǹ���)"));
		m_eng.append(new Concept("������ �ս�", "�۾��� �Ϸ�Ǵµ� �⿩���� ���� ä ����� ������ (������ �ս��� ���̱� ���ؼ��� ������ ��뷮(19��, 20��)�� �����ϴ� ������� �ٸ� ����� �䱸�ϹǷ� �ٸ� ���к����� �и���)"));
		m_eng.append(new Concept("������ �ս�", "�ý����� ���, ����, ��ǰ, Ȥ�� �����ý����� �κ���, ������, ������ Ȥ�� �������� �ս�"));
		m_eng.append(new Concept("������ �ս�", "�ý��� ���� Ȥ�� �ý��ۿ� ���� ������ �κ���, ������, ������  Ȥ�� �������� �ս� (�Ʒθ�, ���� ��� ���� ������ �������� �սǵ� ������)"));
		m_eng.append(new Concept("�ð� ����", "� Ȱ���� ����Ǿ�� �ϴ� �ð��� ������ ����Ǵ� �ð� ���� ���� (�ϳ��� Ȱ���� ����Ǵ� �Ⱓ�� �ð����� ����, �ð� ���� �����Ѵٴ� ���� �۵��� ���� �ҿ�Ǵ� �ð��� ���δٴ� ���� �ǹ��ϸ�, ������Ŭ Ÿ�� ���ҡ��� �Ϲ������� ���Ǵ� �����)"));
		m_eng.append(new Concept("������ ��", "������, �κ�������, ������ Ȥ�� ���������� ��ȭ�� �� �ִ� �ý����� �����ý���(���, ��ǰ)�� �ѷ�"));
		m_eng.append(new Concept("�ŷڼ�", "�ý����� �Ϲ����� ���¿��� �Ӹ� �ƴ϶� ������ �� ���� ��Ȳ�̳� ���ǿ����� �ý����� ����� �����ϰ� �����ϴ� �ɷ�"));
		m_eng.append(new Concept("������ ��Ȯ��", "�ý����� Ư���� ������ ���� ���� ���� �󸶳� �����Ѱ��� ����  (���� ������ ���̴� ���� ������ ��Ȯ���� ���̴� �����)"));
		m_eng.append(new Concept("������ ���м�", "�ý����̳� ��ü�� ���� Ư�� ���� Ư���ǰų� �䱸�� Ư�� ���� ��ġ�ϴ� ����"));
		m_eng.append(new Concept("�ܺηκ��� ������ �޴� ���ۿ�", "�ܺ������� ������ ������ ���ڿ� ���� �ý����� �ΰ���"));
		m_eng.append(new Concept("����� ������ ���ۿ�", "��ü�� �ý����� �۾��� �Ϻη� ��Ÿ���� ������ ���� (��ü�� �ý����� �ܺ� ȯ�濡 ������ ������ �ʷ��ϴ� �ۿ��� �����ϴ� ��)"));
		m_eng.append(new Concept("������ ���̼�", "��ü�� �ý����� ���� �Ǵ� �����ϴµ� �־� �󸶳� ����, ����ϰ�, ����� �� �������� ����"));
		m_eng.append(new Concept("����� ���̼� ", "�۾��̳� ����� �ܼ��� ���� (���� ����̳� ���� �۾� �ܰ�, Ư���� ���� ���� �䱸���� �ʾƾ� ������ ����)"));
		m_eng.append(new Concept("������ ���̼�", "�ý����� �����̳� ����, �ҷ��� �����ϴ� �ð��̳� ��� ���� �ܼ��� ����  "));
		m_eng.append(new Concept("������(������)", "�ý����̳� ��ü�� �ܺ� ��ȭ�� ���������� �����ϴ� ���� (��ü�� �ý����� �پ��� ȯ�濡�� ���� ���� ������� ���� �� ������ �������� ���� ����)"));
		m_eng.append(new Concept("��ġ�� ���⼺", "�ý����� �����ϴ� ����� ���� �پ缺, �ý��� ���� ��� ���� ��ȣ�ۿ� ���� (���� ��� ���� �پ缺, ���� ��� ���� ��ȣ�ۿ��� �������� ������ ����)"));
		m_eng.append(new Concept("����� ������ ���̵�", "����� ������ �䱸�Ǵ� ��ġ�� �ð�, ���, �뵿�� ���� ����  (��� ������ ������ ������Ű�� ���� ��������� �����ϴ� �͵� ������ ���̵��� ������ ������ ��)"));
		m_eng.append(new Concept("�ڵ�ȭ�� ����", "����� ���� ���� �ý����̳� ��ü�� �� ����� �����ϴ� ���� (�ڵ�ȭ�� ������ ���� ���� ������ ������ �۵��ϴ� ������ ����ϴ� ���̰�, ���� ���� ������ ��谡 �ʿ��� �۾��� �������� �����ϰ� ������ �۾��ϰ� ����͸����� �ϴ� ����)"));
		m_eng.append(new Concept("���꼺", "���� �ð� �� �ý��ۿ� ���� ����� ����̳� �۾��� �� "));

		m_list.append("QWEQWEQWE111");
		m_list.append("QWEQWEQWE");
		m_list.append("QWEQWEQWE");
		m_list.append("QWEQWEQWE");
		m_list.append("QWEQWEQWE");

		for (int i = 0; i < m_eng.length(); i++)
			qobject_cast<Concept*>(m_eng[i])->setId(i);

	}

	Q_INVOKABLE QList<QObject*> eng() const { return m_eng; }
	Q_INVOKABLE QList<Concept*> inv() const { return m_inv; }
	Q_INVOKABLE QList<QString> list() const { return m_list; }
	Q_INVOKABLE QString getTest() const { return "TEST"; }

	public slots :
		void setEng(const QList<QObject*> m) { m_eng = m; emit engChanged(); }
		void setInv(const QList<Concept*> m) { m_inv = m; emit invChanged(); }
		void setList(const QList<QString> m) { m_list = m; emit listChanged(); }

		signals :
		void engChanged();
		void invChanged();
		void listChanged();

private:
	QList<QObject*> m_eng;
	QList<Concept*> m_inv;
	QList<QString> m_list;
};
